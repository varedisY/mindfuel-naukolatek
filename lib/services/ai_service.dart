import 'dart:async';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  static final aiSystemMessage = OpenAIChatCompletionChoiceMessageModel(
    content: [
      OpenAIChatCompletionChoiceMessageContentItemModel.text(
        "Return any message you are given as JSON.",
      ),
    ],
    role: OpenAIChatMessageRole.assistant,
  );

  AIService() {
    final apiKey = dotenv.env['OPENAI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('OPENAI_API_KEY not found in .env file.');
    }
    OpenAI.apiKey = apiKey;
  }

  Future<String> create(String prompt) async {
    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt)],
      role: OpenAIChatMessageRole.user,
    );

    final requestMessages = [aiSystemMessage, userMessage];

    try {
      final response = await OpenAI.instance.chat.create(
        model: "gpt-4o-mini",
        responseFormat: {"type": "json_object"},
        seed: 6,
        messages: requestMessages,
        temperature: 0.2,
        maxTokens: 500,
      );

      return response.choices.first.message.content?[0].text ?? 'No response';
    } catch (e) {
      print('Error in create: $e');
      return 'An error occurred.';
    }
  }

  Stream<String> generateStream(String prompt) async* {
    try {
      final userMessage = OpenAIChatCompletionChoiceMessageModel(
        content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text(prompt),
        ],
        role: OpenAIChatMessageRole.user,
      );

      final stream = OpenAI.instance.chat.createStream(
        model: "gpt-4o-mini",

        messages: [aiSystemMessage, userMessage],
      );

      await for (final chatCompletion in stream) {
        final content = chatCompletion.choices.first.delta.content;
        if (content != null) {
          yield content[0]?.text ?? "chujowa abstrakcja xd";
        }
      }
    } catch (e) {
      print('Error generating stream: $e');
      yield 'An error occurred.';
    }
  }
}

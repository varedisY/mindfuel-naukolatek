import 'dart:async';
import 'dart:convert';
import 'package:asq_app/models/question.dart';
import 'package:asq_app/screens/session_outcome.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  // Configuration constants
  static const _modelName = "gpt-4-turbo"; // Updated to more capable model
  static const _maxRetries = 2;
  static const _timeoutDuration = Duration(seconds: 30);

  // System messages with optimized prompts
  static final _questionGenerationPrompt =
      OpenAIChatCompletionChoiceMessageModel(
        content: [
          OpenAIChatCompletionChoiceMessageContentItemModel.text('''
You are a mindful reflection assistant helping teens develop self-awareness. 
Generate 3 unique questions following these rules:

FORMAT (strict JSON):
{
  "questions": [
    {
      "content": "Creative question here", 
      "hints": ["Hint 1", "Hint 2"],
      "style": "poetic/philosophical/playful/scientific" 
    }
  ]
}

RULES:
1. NEVER use generic questions like "How do you feel?"
2. Rotate styles: poetic, philosophical, playful, scientific
3. Focus on:
   - Emotional awareness
   - Social relationships
   - Digital wellbeing
   - Personal growth
4. Make questions thought-provoking but not overwhelming
5. Use simple, clear language suitable for teens
6. Include 2 helpful hints per question
'''),
        ],
        role: OpenAIChatMessageRole.system,
      );

  static final _analysisPrompt = OpenAIChatCompletionChoiceMessageModel(
    content: [
      OpenAIChatCompletionChoiceMessageContentItemModel.text('''
You're a compassionate digital wellbeing assistant analyzing a teen's reflections.
Provide thoughtful insights with:

GUIDELINES:
1. Speak warmly like a mentor, not a therapist
2. Highlight positive patterns first
3. Gently note any concerning patterns
4. Relate to digital habits when relevant
5. Keep language simple and encouraging
6. Suggest 1-2 small, actionable steps
7. Avoid clinical jargon
8. Never judge - only observe and suggest

FORMAT:
- No headings or markdown
- 3-5 concise paragraphs
- End with an encouraging question
'''),
    ],
    role: OpenAIChatMessageRole.system,
  );

  AIService() {
    final apiKey = dotenv.env['OPENAI_API_KEY'];
    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('OPENAI_API_KEY not found in .env file.');
    }
    OpenAI.apiKey = apiKey;
  }

  Future<String> createOutcome({required SessionOutcomeData args}) async {
    final userMessageContent = args.questions
        .asMap()
        .entries
        .map((entry) {
          final index = entry.key;
          final question = entry.value;
          return "Q: ${question.content}\nA: ${args.answers[index]}";
        })
        .join("\n\n");

    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text(
          userMessageContent,
        ),
      ],
      role: OpenAIChatMessageRole.user,
    );

    final requestMessages = [_analysisPrompt, userMessage];

    try {
      final response = await _withRetry(
        () => OpenAI.instance.chat.create(
          model: _modelName,
          messages: requestMessages,
          temperature: 0.7,
          maxTokens: 500,
        ),
      );

      return response.choices.first.message.content![0].text!.trim();
    } catch (e) {
      return "I noticed some interesting patterns in your reflections. "
          "Let's explore these together in our next session.";
    }
  }

  Future<List<Question>> createQuestions() async {
    try {
      final response = await _withRetry(
        () => OpenAI.instance.chat.create(
          model: _modelName,
          responseFormat: {"type": "json_object"},
          messages: [_questionGenerationPrompt],
          temperature: 0.9,
          maxTokens: 400,
        ),
      );

      final responseText =
          response.choices.first.message.content![0].text!.trim();
      final jsonResponse = jsonDecode(responseText) as Map<String, dynamic>;

      final questions =
          (jsonResponse['questions'] as List)
              .map((q) => Question.fromJson(q))
              .toList();

      if (questions.length < 3) {
        throw Exception('Insufficient questions generated');
      }

      return questions;
    } catch (e) {
      print('Question generation error: $e');
      // Fallback questions
      return [
        Question(
          content: "If your mood today was weather, what would it be and why?",
          hints: [
            "Think beyond just sunny/rainy",
            "Consider changes throughout the day",
          ],
        ),
        Question(
          content:
              "What's one digital interaction that left you feeling good today?",
          hints: [
            "Could be a message, post, or video",
            "What specifically made it positive?",
          ],
        ),
        Question(
          content:
              "Imagine your attention span as a muscle - how exercised does it feel today?",
          hints: [
            "Consider focus vs distraction",
            "Think about what strengthened or tired it",
          ],
        ),
      ];
    }
  }

  Future<T> _withRetry<T>(Future<T> Function() fn) async {
    int attempt = 0;
    while (true) {
      try {
        return await fn().timeout(_timeoutDuration);
      } catch (e) {
        if (++attempt >= _maxRetries) rethrow;
        await Future.delayed(const Duration(seconds: 1));
      }
    }
  }
}

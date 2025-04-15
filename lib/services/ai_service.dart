import 'dart:async';
import 'dart:convert';
import 'package:asq_app/models/question.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  static final aiCreateSystemMessage = OpenAIChatCompletionChoiceMessageModel(
    content: [
      OpenAIChatCompletionChoiceMessageContentItemModel.text('''

Jako asystent mindfulness wygeneruj 3 pytania poslugując się tym zasadom:

ZACHOWAJ FORMAT:
[{
  "content": "TUTAJ NAPRAWDĘ TWÓRCZE PYTANIE", 
  "hints": [
    "Podpowiedź 1",
    "Podpowiedź 2" 
  ],

}]

ZASADY:
- Odpowiedź generuj w formacie JSON
- Absolutny zakaz generowania typowych pytań typu "Jak się czujesz?"
- Rotuj style: poetycki, filozoficzny, dziecięcy, naukowy
'''),
    ],
    role: OpenAIChatMessageRole.assistant,
  );

  static final aiOutcomeSystemMessage = OpenAIChatCompletionChoiceMessageModel(
    content: [
      OpenAIChatCompletionChoiceMessageContentItemModel.text('''

Jako asystent mindfulness stworz sprawozdanie na temat odpowiedzi usera:
Przeprowadz głeboką analize i przedstaw swoje wnioski.
'''),
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

  Future<List<Question>> createOutcome() async {
    final aiOutcomeUserMessage = OpenAIChatCompletionChoiceMessageModel(
      content: [
        OpenAIChatCompletionChoiceMessageContentItemModel.text('''

Jako asystent mindfulness stworz sprawozdanie na temat odpowiedzi usera:
Przeprowadz głeboką analize i przedstaw swoje wnioski.
'''),
      ],
      role: OpenAIChatMessageRole.assistant,
    );

    final requestMessages = [aiCreateSystemMessage];

    try {
      final response = await OpenAI.instance.chat.create(
        model: "gpt-4o-mini",
        responseFormat: {"type": "json_object"},
        temperature: 1, // Zwiększ dla większej kreatywności (zakład 0.1-1.0)
        topP: 1, // Dodaj to dla lepszej różnorodności
        frequencyPenalty: 0.8, // Kara za powtarzanie tych samych słów
        presencePenalty: 0.8, // Kara za powtarzanie tematów
        messages: requestMessages,
      );

      final jsonResponse = jsonDecode(
        response.choices.first.message.content![0].text!.trim(),
      );

      final List<dynamic> questions = jsonResponse['questions'];
      print(questions);
      return questions.map((question) => Question.fromJson(question)).toList();
    } catch (e) {
      print('Error in create: $e');
      return [];
    }
  }

  Future<List<Question>> createQuestions() async {
    final requestMessages = [aiCreateSystemMessage];

    try {
      final response = await OpenAI.instance.chat.create(
        model: "gpt-4o-mini",
        temperature: 1, // Zwiększ dla większej kreatywności (zakład 0.1-1.0)
        topP: 1, // Dodaj to dla lepszej różnorodności
        frequencyPenalty: 0.8, // Kara za powtarzanie tych samych słów
        presencePenalty: 0.8, // Kara za powtarzanie tematów
        messages: requestMessages,
      );

      final jsonResponse = jsonDecode(
        response.choices.first.message.content![0].text!.trim(),
      );

      final List<dynamic> questions = jsonResponse['questions'];
      print(questions);
      return questions.map((question) => Question.fromJson(question)).toList();
    } catch (e) {
      print('Error in create: $e');
      return [];
    }
  }
}

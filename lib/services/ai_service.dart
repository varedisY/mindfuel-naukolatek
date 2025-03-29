import 'dart:async';
import 'dart:convert';
import 'package:asq_app/models/question.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService {
  static final aiSystemMessage = OpenAIChatCompletionChoiceMessageModel(
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
  "duration": 90,
  "followUpOptions": [
      "Chcę pogłębić tę refleksję",
      "Wolę zmienić temat"
  ]
}]

ZASADY:
- Odpowiedź generuj w formacie JSON
- Absolutny zakaz generowania typowych pytań typu "Jak się czujesz?"
- Minimum 70% pytań musi używać niestandardowych porównań
- Rotuj style: poetycki, filozoficzny, dziecięcy, naukowy
- W co 5-tym pytaniu zastosuj całkowicie absurdalne podejście ("Gdybyś miał(a) zaprojektować zapach spokoju, jakie miałby nuty?")
- Używaj konkretów zamiast ogólników ("Który kąt w twoim mieszkaniu najlepiej oddaje twój obecny stan?")

PRZYKŁADY DOBREJ ODPOWIEDZI:
"content": "Jeśli twoje myśli byłyby ptakami, jaki gatunek dominuje dziś w twoim 'ptasim rezerwacie'?" 
"content": "Jaką nieoczywistą supermoc dał ci dzisiejszy dzień?"
"content": "Gdybyś mógł(a) wysłać wiadomość do siebie sprzed roku jednym zapachem, co by to było?"
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

  Future<List<Question>> create() async {
    final requestMessages = [aiSystemMessage];

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

      return questions.map((question) => Question.fromJson(question)).toList();
    } catch (e) {
      print('Error in create: $e');
      return [];
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

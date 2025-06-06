import 'package:asq_app/models/question.dart';
import 'package:asq_app/services/ai_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Necessary for code-generation to work
part 'session_provider.g.dart';

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
@riverpod
Future<List<Question>> questions(Ref ref) async {
  final aiService = AIService();

  return await aiService.createQuestions();
}

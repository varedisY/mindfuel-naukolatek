import 'package:asq_app/models/question.dart';
import 'package:flutter/cupertino.dart';

class SessionOutcomeArgs {
  final List<Question> questions;
  final List<String> answers;

  SessionOutcomeArgs(this.questions, this.answers);
}

class SessionOutcome extends StatelessWidget {
  const SessionOutcome({super.key});

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as SessionOutcomeArgs;

    print(args);
    return const Placeholder();
  }
}

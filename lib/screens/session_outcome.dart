import 'package:asq_app/models/question.dart';
import 'package:asq_app/spaces.dart';
import 'package:asq_app/state/session_outcome_provider.dart';
import 'package:asq_app/styles.dart';
import 'package:asq_app/widgets/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionOutcomeArgs {
  final List<Question> questions;
  final List<String> answers;

  SessionOutcomeArgs(this.questions, this.answers);
}

class SessionOutcome extends ConsumerWidget {
  const SessionOutcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args =
        ModalRoute.of(context)!.settings.arguments as SessionOutcomeArgs;

    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("Result"),
            trailing: CupertinoButton(
              padding: EdgeInsets.all(0),
              child: Text("Return to home"),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: p4, vertical: p4),
            sliver: ref
                .watch(outcomeProvider(args))
                .when(
                  data: (data) {
                    return SliverList.list(children: [Text(data)]);
                  },
                  error: (e, v) {
                    return SliverFillRemaining(
                      child: Center(child: Text(e.toString())),
                    );
                  },
                  loading: () {
                    return SliverFillRemaining(
                      child: CupertinoActivityIndicator(),
                    );
                  },
                ),
          ),
        ],
      ),
    );
  }
}

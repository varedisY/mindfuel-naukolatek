import 'package:asq_app/home.dart';
import 'package:asq_app/models/question.dart';
import 'package:asq_app/spaces.dart';
import 'package:asq_app/state/session_outcome_provider.dart';
import 'package:asq_app/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionOutcomeData {
  final List<Question> questions;
  final List<String> answers;

  SessionOutcomeData(this.questions, this.answers);
}

class SessionOutcome extends ConsumerWidget {
  final SessionOutcomeData outcome;
  const SessionOutcome({super.key, required this.outcome});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            largeTitle: Text("Result"),
            trailing: CupertinoButton(
              padding: EdgeInsets.all(0),
              child: Text("Return to home"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  CupertinoPageRoute(builder: (context) => HomeScreen()),
                );
              },
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.all(p4),
            sliver: ref
                .watch(outcomeProvider(outcome))
                .when(
                  data: (data) {
                    return SliverList.list(
                      children: [Text(data), SizedBox(height: p10)],
                    );
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

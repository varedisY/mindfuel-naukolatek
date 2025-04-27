import 'package:asq_app/home.dart';
import 'package:asq_app/screens/session.dart';
import 'package:asq_app/screens/session_loading.dart';
import 'package:asq_app/spaces.dart';
import 'package:asq_app/state/session_provider.dart';
import 'package:asq_app/styles.dart';
import 'package:asq_app/widgets/background.dart';
import 'package:asq_app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SessionWrapper extends ConsumerWidget {
  const SessionWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final questions = ref.watch(questionsProvider);

    return CupertinoPageScaffold(
      child: Container(
        child: Stack(
          children: [
            Positioned.fill(child: Background()),
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: p4),
                child: SizedBox.expand(
                  child: questions.when(
                    data: (questions) => Session(questions: questions),
                    error: (e, v) => Center(child: Text("AN ERROR")),
                    loading: () => SessionLoading(),
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: p4,
              right: p4,
              child: SafeArea(
                top: false,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GlassButton(
                      child: Text(
                        "Cancel",
                        style: TextStyle(color: sessionTextColor),
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          CupertinoDialogRoute(
                            context: context,
                            builder: (context) => HomeScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

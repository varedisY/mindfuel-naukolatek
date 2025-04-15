import 'package:asq_app/modals/welcome_modal.dart';
import 'package:asq_app/models/question.dart';
import 'package:asq_app/screens/question.dart';
import 'package:asq_app/screens/session_outcome.dart';
import 'package:asq_app/spaces.dart';
import 'package:asq_app/styles.dart';
import 'package:asq_app/widgets/button.dart';
import 'package:flutter/cupertino.dart';

class Session extends StatefulWidget {
  final List<Question> questions;
  const Session({super.key, required this.questions});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  final PageController _controller = PageController();
  late List<String> answers;

  @override
  void initState() {
    super.initState();

    answers = List.generate(widget.questions.length, (index) => "");
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "Wstecz",
                    style: TextStyle(color: sessionTextColor),
                  ),
                  onPressed: () {
                    _controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                CupertinoButton(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    "Dalej",
                    style: TextStyle(color: sessionTextColor),
                  ),
                  onPressed: () {
                    final isLast =
                        _controller.page!.toInt() ==
                        widget.questions.length - 1;
                    if (isLast) {
                      Navigator.of(context).pushNamed(
                        "/session-outcome",
                        arguments: SessionOutcomeArgs(
                          widget.questions,
                          answers,
                        ),
                      );

                      return;
                    }

                    _controller.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: p4),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                itemCount: widget.questions.length,
                itemBuilder: (context, index) {
                  final isLast = index == widget.questions.length - 1;

                  return QuestionForm(
                    onAnswerChanged: (value) => {answers[index] = value},
                    question: widget.questions[index],
                    isLast: isLast,
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

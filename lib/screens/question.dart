import 'package:asq_app/models/question.dart';
import 'package:asq_app/spaces.dart';
import 'package:asq_app/styles.dart';
import 'package:asq_app/widgets/hint.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class QuestionForm extends StatefulWidget {
  final bool isLast;
  final Question question;
  final Function onAnswerChanged;
  const QuestionForm({
    super.key,
    required this.question,
    this.isLast = false,
    required this.onAnswerChanged,
  });

  @override
  State<QuestionForm> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AutoSizeText(
          maxLines: 3,

          widget.question.content,
          style: TextStyle(
            color: sessionTextColor,
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),

        SizedBox(height: p6),
        Hints(texts: widget.question.hints, visible: false),

        CupertinoTextField.borderless(
          autofocus: true,
          maxLines: null,
          placeholder: "Your answer...",
          onChanged: (value) {
            widget.onAnswerChanged(value);
            // widget.question.content = value;
          },
          placeholderStyle: TextStyle(color: sessionTextColor),
          style: TextStyle(color: sessionTextColor),
          cursorColor: sessionTextColor,
        ),
      ],
    );
  }
}

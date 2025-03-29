import 'dart:ffi';

import 'package:asq_app/models/question.dart';
import 'package:asq_app/spaces.dart';
import 'package:asq_app/styles.dart';
import 'package:asq_app/widgets/hint.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';

class Session extends StatefulWidget {
  final List<Question> questions;
  const Session({super.key, required this.questions});

  @override
  State<Session> createState() => _SessionState();
}

class _SessionState extends State<Session> {
  bool showHints = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AutoSizeText(
          maxLines: 3,

          widget.questions[0].content,
          style: TextStyle(color: sessionTextColor, fontSize: 40),
        ),

        SizedBox(height: p4),
        Hints(texts: widget.questions[0].hints, visible: false),
        SizedBox(height: p4),

        CupertinoTextField.borderless(
          autofocus: true,
          maxLines: null,
          placeholder: "Your answer here...",
          placeholderStyle: TextStyle(color: sessionTextColor),
          style: TextStyle(color: sessionTextColor),
          cursorColor: sessionTextColor,
        ),
      ],
    );
  }
}

import 'package:asq_app/spaces.dart';
import 'package:asq_app/styles.dart';
import 'package:asq_app/widgets/background.dart';
import 'package:asq_app/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SessionLoading extends StatelessWidget {
  const SessionLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CupertinoActivityIndicator(color: Colors.white),
        SizedBox(height: p6),
        Text("Generating Questions", style: TextStyle(color: sessionTextColor)),
      ],
    );
  }
}

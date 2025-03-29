import 'package:asq_app/models/question.dart';
import 'package:asq_app/services/ai_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Playground extends StatefulWidget {
  const Playground({super.key});

  @override
  State<Playground> createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  List<Question> questions = [];
  final AIService aiService = AIService();

  generateResponse() {
    aiService.create().then((v) {
      setState(() {
        questions = v;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    generateResponse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final question in questions) ...{
          CupertinoListTile(title: Text(question.content)),
        },

        CupertinoButton(
          child: Text("GENERATE"),
          onPressed: () {
            generateResponse();
          },
        ),
      ],
    );
  }
}

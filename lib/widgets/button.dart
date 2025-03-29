import 'dart:ui';

import 'package:asq_app/spaces.dart';
import 'package:asq_app/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const GlassButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: CupertinoButton(
          color: Colors.white.withAlpha(50),
          borderRadius: BorderRadius.circular(50),
          padding: EdgeInsets.symmetric(vertical: p1, horizontal: p6),
          child: Text(text, style: TextStyle(color: sessionTextColor)),
          onPressed: () {
            onPressed();
          },
        ),
      ),
    );
  }
}

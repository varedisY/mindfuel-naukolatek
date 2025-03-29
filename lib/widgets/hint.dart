import 'dart:ui';

import 'package:asq_app/spaces.dart';
import 'package:asq_app/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Hints extends StatelessWidget {
  final List<String> texts;
  final bool visible;
  const Hints({super.key, required this.texts, this.visible = true});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(p4),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          height: visible ? null : 0,
          color: Colors.white.withAlpha(50),
          padding: EdgeInsets.symmetric(horizontal: p4, vertical: p2),
          child: Column(
            children: [
              for (final hint in texts) ...{
                Text(hint, style: TextStyle(color: sessionTextColor)),
              },
            ],
          ),
        ),
      ),
    );
  }
}

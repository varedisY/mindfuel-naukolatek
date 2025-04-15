import 'dart:ui';

import 'package:asq_app/spaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final EdgeInsets? padding;
  const GlassButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
        child: CupertinoButton(
          color: Colors.white.withAlpha(50),
          borderRadius: BorderRadius.circular(50),
          padding:
              padding ?? EdgeInsets.symmetric(vertical: p1, horizontal: p6),
          child: child,
          onPressed: () {
            onPressed();
          },
        ),
      ),
    );
  }
}

import 'package:asq_app/spaces.dart';
import 'package:asq_app/widgets/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SessionTile extends StatelessWidget {
  const SessionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(p4),
      child: Stack(
        children: [
          SizedBox.expand(child: Background()),
          Positioned(
            bottom: p4,
            left: p4,
            child: Text(
              "Świadomość",
              style: TextStyle(
                fontSize: p5,
                fontWeight: FontWeight.w700,
                color: CupertinoColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

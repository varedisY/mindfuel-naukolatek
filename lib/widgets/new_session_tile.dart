import 'package:asq_app/screens/session_wrapper.dart';
import 'package:asq_app/screens/session_loading.dart';
import 'package:asq_app/spaces.dart';
import 'package:asq_app/widgets/background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewSessionTile extends StatelessWidget {
  const NewSessionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(p4),
        border: Border.all(width: 1, color: CupertinoColors.activeBlue),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CupertinoButton(
            child: Icon(CupertinoIcons.add_circled, size: p8),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(builder: (context) => SessionWrapper()),
              );
            },
          ),
          Text(
            "New session",
            style: TextStyle(color: CupertinoColors.activeBlue),
          ),
        ],
      ),
    );
  }
}

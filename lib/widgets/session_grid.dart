import 'package:asq_app/spaces.dart';
import 'package:asq_app/widgets/new_session_tile.dart';
import 'package:asq_app/widgets/session_tile.dart';
import 'package:flutter/material.dart';

class SessionGrid extends StatelessWidget {
  const SessionGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: p2, // Spacing between columns
        mainAxisSpacing: p2, // Spacing between rows
        childAspectRatio: 3 / 4, // Aspect ratio of each item
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == 0) return NewSessionTile();
          return SessionTile();
        },
        childCount: 20, // Number of items
      ),
    );
  }
}

import 'package:asq_app/spaces.dart';
import 'package:asq_app/widgets/session_grid.dart';
import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(largeTitle: Text("Sessions")),

          // SliverFillRemaining(child: Playground(), hasScrollBody: false),
          SliverPadding(padding: EdgeInsets.all(p4), sliver: SessionGrid()),
        ],
      ),
    );
  }
}

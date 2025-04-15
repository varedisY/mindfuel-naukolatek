import 'package:asq_app/modals/welcome_modal.dart';
import 'package:asq_app/spaces.dart';
import 'package:asq_app/widgets/session_grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:localstorage/localstorage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final isFirstTime = bool.parse(
        localStorage.getItem('isFirstTime') ?? "true",
      );

      if (isFirstTime) {
        showCupertinoModalPopup(
          context: context,
          builder: (context) => WelcomeModal(),
        );
        localStorage.setItem('isFirstTime', "false");
      }
    });
  }

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

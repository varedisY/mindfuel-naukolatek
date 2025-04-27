import 'package:asq_app/home.dart';
import 'package:asq_app/screens/session_outcome.dart';
import 'package:asq_app/screens/session_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:localstorage/localstorage.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await initLocalStorage();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      initialRoute: "/",

      routes: {
        "/": (context) => HomeScreen(),
        "/session": (context) => SessionWrapper(),
        "/session-outcome": (context) => SessionOutcome(),
      },

      debugShowCheckedModeBanner: false,
    );
  }
}

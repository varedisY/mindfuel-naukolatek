import 'package:asq_app/spaces.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeModal extends StatelessWidget {
  const WelcomeModal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screen(context).height * 0.7,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: p4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(p5),
          color: CupertinoTheme.of(context).barBackgroundColor,
        ),
        child: ListView(
          children: [
            Text(
              'Witamy w Sessions! 🌿',
              style: TextStyle(fontSize: p8, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: p6),
            Text('''
Twoja przestrzeń do głębokiej refleksji i uważności. ✨

Sessions to wyjątkowa podróż w głąb siebie – odpowiadaj na pytania zadawane przez AI i przesuwaj w prawo, by przechodzić dalej. Bez pośpiechu, bez ocen – tylko Ty i Twoje myśli.

💡 Otwórz się na nowe perspektywy
🧘‍♂️ Zatrzymaj się na chwilę
📖 Poznaj siebie lepiej

Gotowy, by rozpocząć swoją sesję? ✨
''', style: TextStyle(fontSize: p5, fontWeight: FontWeight.w400)),

            Center(
              child: CupertinoButton(
                child: Text("Przejdź do Aplikacji"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

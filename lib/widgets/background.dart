import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

const bgColors = [
  [Colors.orange, Colors.orangeAccent, Colors.deepOrangeAccent, Colors.black],
  [Colors.blue, Colors.blueAccent, Colors.lightBlue, Colors.black],
  [Colors.purple, Colors.deepPurple, Colors.deepPurpleAccent, Colors.black],
  [Colors.green, Colors.greenAccent, Colors.teal, Colors.black],
];

class Background extends StatefulWidget {
  const Background({super.key});

  @override
  State<Background> createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  late List<Color> colors;

  @override
  void initState() {
    super.initState();
    changeColors();
  }

  changeColors() {
    final int randomIndex = Random().nextInt(bgColors.length);

    setState(() {
      colors = bgColors[randomIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedMeshGradient(
      colors: [Colors.blue, Colors.blueAccent, Colors.lightBlue, Colors.black],
      options: AnimatedMeshGradientOptions(speed: 0.1, frequency: 3),
    );
  }
}

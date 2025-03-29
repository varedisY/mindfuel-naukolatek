import 'package:flutter/material.dart';
import 'package:mesh_gradient/mesh_gradient.dart';

class Background extends StatelessWidget {
  final List<Color> colors;
  const Background({
    super.key,
    this.colors = const [
      Colors.blueAccent,
      Colors.blue,
      Colors.blue,
      Colors.black,
    ],
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedMeshGradient(
      colors: colors,
      options: AnimatedMeshGradientOptions(),
    );
  }
}

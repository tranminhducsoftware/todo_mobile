import 'package:flutter/material.dart';
import 'package:todo_mobile/taskez_template/Values/values.dart';

// ignore: must_be_immutable
class DarkRadialBackground extends StatelessWidget {
  final String position;
  final Color color;
  var list = List.generate(
    3,
    (index) => HexColor.fromHex("#074d80"),
  );
  DarkRadialBackground({Key? key, required this.color, required this.position}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            decoration: BoxDecoration(
      gradient: RadialGradient(
        colors: [...list, color],
        center: (position == "bottomRight")
            ? const Alignment(1.0, 1.0)
            : const Alignment(-1.0, -1.0),
      ),
    )));
  }
}

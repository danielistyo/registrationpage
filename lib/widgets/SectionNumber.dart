import 'package:flutter/material.dart';

class SectionNumber extends StatelessWidget {
  final String level;
  final Color colorBb;
  final Color? colorTxt;

  const SectionNumber(
      {Key? key, required this.level, required this.colorBb, this.colorTxt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: colorBb,
          border: Border.all(
              width: 2, color: Colors.black, style: BorderStyle.solid)),
      child: Center(
        child: Text(
          level,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 22.0, color: colorTxt),
        ),
      ),
    );
  }
}

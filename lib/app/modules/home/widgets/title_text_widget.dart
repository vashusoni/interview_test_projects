import 'package:flutter/material.dart';

class TitleTextWidget extends StatelessWidget {
  String name;

  TitleTextWidget(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
    );
  }
}

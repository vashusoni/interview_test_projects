import 'package:flutter/material.dart';

class DetailsTextWidget extends StatelessWidget {
  String details;

  DetailsTextWidget(this.details);

  @override
  Widget build(BuildContext context) {
    return Text(
      details,
      style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
    );
  }
}

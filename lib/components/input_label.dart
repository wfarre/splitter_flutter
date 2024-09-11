import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  const InputLabel({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        title,
        style: const TextStyle(
            color: Color(0xFF00494d),
            fontSize: 14.0,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

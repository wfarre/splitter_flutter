import 'package:flutter/material.dart';

class ResultBlock extends StatelessWidget {
  ResultBlock({super.key, required this.title, required this.result});

  final String title;
  double result = 0.00;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w900),
            ),
            Text(
              '/person',
              style: TextStyle(fontSize: 11.0, color: Color(0xFF7f9c9f)),
            )
          ],
        ),
        Text(
          '\$${result.toStringAsFixed(2)}',
          style: TextStyle(
              fontSize: 24.0,
              color: Color(0xFF26c0ab),
              fontWeight: FontWeight.w900),
        )
      ],
    );
  }
}

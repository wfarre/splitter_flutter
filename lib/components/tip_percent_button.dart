import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_flutter/tip_provider.dart';

class TipPercentButton extends StatelessWidget {
  TipPercentButton({super.key, required this.percentage});

  final int percentage;
  // print(context.watch<TipProvider>().percent)

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 147.0,
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: context.watch<TipProvider>().percent == percentage
                ? Color(0xFF26c0ab)
                : Color(0xFF00494d),
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20.0))),
        onPressed: () {
          context.read<TipProvider>().updatePercent(percentage);
        },
        child: Text(
          '$percentage%',
          style: TextStyle(
              color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}

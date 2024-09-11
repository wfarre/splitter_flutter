import 'package:flutter/material.dart';
import 'package:splitter_flutter/components/input_label.dart';
import 'package:splitter_flutter/components/tip_percent_button.dart';
import 'package:splitter_flutter/tip_provider.dart';

List<int> percentOption = [5, 10, 15, 25, 50];

class TipSelector extends StatefulWidget {
  const TipSelector({super.key});

  @override
  State<TipSelector> createState() => _TipSelectorState();
}

class _TipSelectorState extends State<TipSelector> {
  late int currentPercent;

  void updateCurrentPercent(newValue) {
    setState(() {
      currentPercent = newValue;
    });
  }

  late List<TipPercentButton> buttons = percentOption
      .map((el) => TipPercentButton(
            percentage: el,
          ))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      InputLabel(
        title: 'Select Tip %',
      ),
      Wrap(
        runSpacing: 16.0,
        direction: Axis.horizontal,
        alignment: WrapAlignment.spaceBetween,
        children: buttons,
      ),
    ]);
  }
}

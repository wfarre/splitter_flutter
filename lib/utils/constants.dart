import 'package:flutter/material.dart';

var kTextFieldInputDecoration = InputDecoration(
  hintText: '0',
  contentPadding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 17.0),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        style: BorderStyle.none,
        width: 0.0,
      )),
  filled: true,
  fillColor: Color(0xFFf4fafa),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      width: 2.0,
      color: Color(0xFF26c0ab),
    ),
  ),
);

const kTextInputTextStyle = TextStyle(
    color: Color(0xFF00494d), fontSize: 24.0, fontWeight: FontWeight.w900);

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:splitter_flutter/components/input_label.dart';
import 'package:splitter_flutter/components/result_block.dart';
import 'package:splitter_flutter/components/tip_selector.dart';
import 'package:splitter_flutter/tip_provider.dart';
import 'package:splitter_flutter/utils/constants.dart';

void main() {
  runApp(MyApp());
}

bool isNumber(String s) {
  if (s == null) {
    return false;
  }

  // TODO according to DartDoc num.parse() includes both (double.parse and int.parse)
  return int.tryParse(s) != null || double.tryParse(s) != null;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TipProvider(),
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.spaceMonoTextTheme(),
        ),
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  final billController = TextEditingController();
  final nbOfPeopleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFc5e4e7),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50.0,
            ),
            SvgPicture.asset('images/logo.svg'),
            SizedBox(
              height: 50.0,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 28.0,
                  vertical: 36.0,
                ),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InputLabel(
                        title: 'Bill',
                      ),
                      TextField(
                        inputFormatters: [
                          // FilteringTextInputFormatter.digitsOnly,
                          FilteringTextInputFormatter.allow(
                              RegExp("[0-9]+.[0-9]"))
                        ],
                        controller: billController,
                        onChanged: (newValue) {
                          context.read<TipProvider>().updateBill(newValue);
                        },
                        style: kTextInputTextStyle,
                        textAlign: TextAlign.end,
                        keyboardType: TextInputType.numberWithOptions(
                            decimal: true, signed: false),
                        decoration: kTextFieldInputDecoration.copyWith(
                          prefixIcon: Icon(
                            Icons.attach_money,
                            color: Color(0xFF7f9c9f),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      TipSelector(),
                      SizedBox(
                        height: 32.0,
                      ),
                      InputLabel(title: 'Number of People'),
                      TextField(
                        controller: nbOfPeopleController,
                        onChanged: (newValue) {
                          if (isNumber(newValue) && newValue != '.') {
                            context
                                .read<TipProvider>()
                                .updateNbOfPeople(newValue);
                          }
                        },
                        textAlign: TextAlign.end,
                        style: kTextInputTextStyle,
                        keyboardType: TextInputType.number,
                        decoration: kTextFieldInputDecoration.copyWith(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color(0xFF7f9c9f),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 28.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xFF00494d),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 40.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            ResultBlock(
                                title: 'Tip Amount',
                                result: context
                                    .watch<TipProvider>()
                                    .tipAmountPerPerson),
                            SizedBox(
                              height: 28.0,
                            ),
                            ResultBlock(
                                title: 'Total',
                                result: context
                                    .watch<TipProvider>()
                                    .totalPerPerson),
                            SizedBox(
                              height: 28.0,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                nbOfPeopleController.clear();
                                billController.clear();
                                context.read<TipProvider>().reset();
                                context
                                    .read<TipProvider>()
                                    .updateNbOfPeople('');
                                context.read<TipProvider>().updateBill('');
                              },
                              child: Text('RESET',
                                  style: TextStyle(color: Color(0xFF00494d))),
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(0xFF26c0ab),
                                  shape: ContinuousRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20.0))),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

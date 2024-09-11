import 'package:flutter/cupertino.dart';

class TipProvider with ChangeNotifier {
  double _bill = 0.0;
  int _nbOfPeople = 0;
  int _percent = 0;
  double _tipAmountPerPerson = 0;
  double _totalPerPerson = 0;

  void updatePercent(newValue) {
    _percent = newValue;

    notifyListeners();
  }

  void updateBill(newValue) {
    _bill = newValue == '' ? 0 : double.parse(newValue);

    notifyListeners();
  }

  void updateNbOfPeople(newValue) {
    _nbOfPeople = newValue == '' ? 0 : int.parse(newValue);

    notifyListeners();
  }

  void reset() {
    _bill = 0.0;
    _nbOfPeople = 0;
    _percent = 0;
    _tipAmountPerPerson = 0;
    _totalPerPerson = 0;
  }

  double calculateTipAmountPerPerson() {
    double tipAmount = 0;

    tipAmount = (_bill * _percent) / 100;
    if (_nbOfPeople != 0) {
      _tipAmountPerPerson = tipAmount / _nbOfPeople;
      return _tipAmountPerPerson;
    }
    _tipAmountPerPerson = 0;
    return _tipAmountPerPerson;
  }

  double calculateTotalPerPerson() {
    if (_nbOfPeople != 0) {
      _totalPerPerson = (_bill / _nbOfPeople) + _tipAmountPerPerson;
      return _totalPerPerson;
    }
    _totalPerPerson = 0;

    return _totalPerPerson;
  }

  double get tipAmountPerPerson {
    calculateTipAmountPerPerson();
    return _tipAmountPerPerson;
  }

  double get totalPerPerson {
    calculateTotalPerPerson();
    return _totalPerPerson;
  }

  int get percent {
    return _percent;
  }
}

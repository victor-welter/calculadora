import '../model/calculadora_model.dart';
import 'package:flutter/material.dart';

class CalculatorController extends ChangeNotifier {
  final _model = CalculatorModel();

  String get displayValue => _model.currentValue;

  void onDigit(String digit) {
    _model.addDigit(digit);
    notifyListeners();
  }

  void onOperation(String operation) {
    if (operation == '%') {
      _model.calculateResult();
    } else {
      _model.setOperation(operation);
    }
    notifyListeners();
  }

  void onEquals() {
    _model.calculateResult();
    notifyListeners();
  }

  void onClear() {
    _model.clear();
    notifyListeners();
  }

  void onRemove() {
    _model.removeLastDigit();
    notifyListeners();
  }

  void onPercentage() {
    _model.calculatePercentage();
    notifyListeners();
  }
}

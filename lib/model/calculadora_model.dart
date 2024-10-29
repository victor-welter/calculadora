class CalculatorModel {
  String _currentValue = '0';
  String _operation = '';
  String _storedValue = '';

  String get currentValue => _currentValue;

  void addDigit(String digit) {
    if (_currentValue == '0' && digit != '0') {
      _currentValue = digit;
    } else {
      _currentValue += digit;
    }
  }

  void removeLastDigit() {
    if (_currentValue.length > 1) {
      _currentValue = _currentValue.substring(0, _currentValue.length - 1);
    } else {
      _currentValue = '0';
    }
  }

  void setOperation(String operation) {
    if (_currentValue.isNotEmpty) {
      if (_operation.isNotEmpty) {
        calculateResult();
      }

      _operation = operation;
      _storedValue = _currentValue;
      _currentValue = '0';
    }
  }

  void calculatePercentage() {
    double current = double.tryParse(_currentValue) ?? 0;

    if (_operation.isNotEmpty) {
      double stored = double.tryParse(_storedValue) ?? 0;
      switch (_operation) {
        case '+':
          _currentValue = ((stored * current) / 100).toString();
          break;
        case '-':
          _currentValue = ((stored * current) / 100).toString();
          break;
        case 'X':
          _currentValue = ((stored * current) / 100).toString();
          break;
        case '/':
          _currentValue = ((stored * current) / 100).toString();
          break;
        default:
          _currentValue = '0';
          break;
      }
    } else {
      _currentValue = (current / 100).toString();
    }
  }

  void calculateResult() {
    if (_operation.isEmpty || _storedValue.isEmpty) return;

    double stored = double.tryParse(_storedValue) ?? 0;
    double current = double.tryParse(_currentValue) ?? 0;

    switch (_operation) {
      case '+':
        _currentValue = (stored + current).toString();
        break;
      case '-':
        _currentValue = (stored - current).toString();
        break;
      case 'X':
        _currentValue = (stored * current).toString();
        break;
      case '/':
        _currentValue = current != 0 ? (stored / current).toString() : 'Error';
        break;
      default:
        break;
    }
    _operation = '';
  }

  void clear() {
    _currentValue = '0';
    _storedValue = '';
    _operation = '';
  }
}

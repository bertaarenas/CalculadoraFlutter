class Calculator {
  String first = '';
  String operator = '';
  String second = '';
  String result = '';

  void press(String key) {
    if (result == 'Error') {
      clear();
    }

    if (key == 'C') {
      clear();
    } else if (key == '=') {
      calculate();
    }
    else if (key == '+' || key == '-' || key == '×' || key == '÷') {
      chooseOperator(key);
    } else {
      addDigit(key);
    }
  }

  void clear() {
    first = '';
    operator = '';
    second = '';
    result = '';
  }

  String addTo(String number, String digit) {
    if (digit == '.' && number.contains('.')) {
      return number;
    }
    return number + digit;
  }

  void addDigit(String digit) {
    if (result != '') {
      clear();
    }

    if (operator == '') {
      first = addTo(first, digit);
    } else {
      second = addTo(second, digit);
    }
  }

  void chooseOperator(String key) {
    if (first != '') {
      operator = key;
    }
  }

  void calculate() {
    if (first == '' || operator == '' || second == '') {
      return;
    }

    double a = double.parse(first);
    double b = double.parse(second);

    double total = 0;

    if (operator == '+') {
      total = a + b;
    } else if (operator == '-') {
      total = a - b;
    } else if (operator == '×') {
      total = a * b;
    } else if (operator == '÷') {
      if (b == 0) {
        result = 'Error';
        return;
      }
      total = a / b;
    }

    if (total == total.toInt()) {
      result = total.toInt().toString();
    } else {
      result = total.toString();
    }
  }

  String get operation {
    String text = '$first $operator $second';

    if (result != '') {
      text = text + ' =';
    }

    return text.trim();
  }
}
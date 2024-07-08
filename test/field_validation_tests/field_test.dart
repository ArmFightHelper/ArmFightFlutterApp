import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Number Validation Function', () {
    test('Returns "Enter number" for null input', () {
      expect(validateNumber(null), equals('Enter number'));
    });

    test('Returns "Enter number" for empty input', () {
      expect(validateNumber(''), equals('Enter number'));
    });

    test('Returns "Enter number" for non-numeric input', () {
      expect(validateNumber('abc'), equals('Enter number'));
    });

    test('Returns null for valid numeric input', () {
      expect(validateNumber('123'), equals(null));
    });
  });

  group('String Validator Function', () {
    test('Returns "Wrong value" for null input', () {
      expect(validateString(null), equals('Wrong value'));
    });

    test('Returns "Wrong value" for empty input', () {
      expect(validateString(''), equals('Wrong value'));
    });

    test('Returns null for non-empty input', () {
      expect(validateString('Hello'), equals(null));
    });
  });
}

String? validateNumber(String? value) {
  if (value == null || value.isEmpty || int.tryParse(value) == null) {
    return 'Enter number';
  }
  return null;
}

String? validateString(String? value) {
  if (value == null || value.isEmpty) {
    return 'Wrong value';
  }
  return null;
}
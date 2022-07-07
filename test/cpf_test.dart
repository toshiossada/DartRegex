// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Validator CPF', () {
    const cpfs = '''
799.851.990-81
237.078.130-X
38528574067
53588599002
123
meu CPF é 17722996000
toshiossada@gmail.com
''';
    final exp = RegExp(
      r"(\d{3})+\.?(\d{3})+\.?(\d{3})+-?([\dxX]{1,2})+",
      multiLine: true,
    );
    if (exp.hasMatch(cpfs)) {
      Iterable<Match> matches = exp.allMatches(cpfs);
      for (var m in matches) {
        debugPrint('CPF: ${m.group(0)} '
            'Grupo 1 ${m.group(1)} '
            'Grupo 2 ${m.group(2)} '
            'Grupo 3 ${m.group(3)} '
            'Digito ${m.group(4)}');
      }
    } else {
      debugPrint('Nenhuma CPF válido');
    }
  });
}

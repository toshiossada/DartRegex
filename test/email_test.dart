// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Validator Email', () {
    const email = 'toshiossada@toshiossada.dev';
    final exp = RegExp(r"^([\w\.-_]+)(@+)([\w]+)((\.+\w{2,3}){1,2})$");

    if (exp.hasMatch(email)) {
      debugPrint('Email invalido!');
    } else {
      debugPrint('Email invalido!');
    }
  });
}

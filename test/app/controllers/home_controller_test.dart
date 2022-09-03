import 'dart:math';

import 'package:conversor/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  final homeController = HomeController(toText: toText, fromText: fromText);

  test('deve converter de real para dolar usando virgula', () {
    fromText.text = '2,0';
    homeController.convert();
    expect(toText.text, '0.3600');
  });

  test('deve converter de real para dolar usando ponto', () {
    fromText.text = '2.0';
    homeController.convert();
    expect(toText.text, '0.3600');
  });

  test('deve converter de dolar para real', () {
    toText.text = '1.0';
    homeController.fromCurrency = homeController.currencies[1];
    homeController.toCurrency = homeController.currencies[0];
    homeController.convert();
    expect(toText.text, '5.6500');
  });
}

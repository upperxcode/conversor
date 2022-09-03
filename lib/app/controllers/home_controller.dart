import 'package:flutter/material.dart';

import '../models/currency_model.dart';

class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController({required this.toText, required this.fromText}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    print('from Currency ${fromCurrency.name}');
    print('to Currency ${toCurrency.name}');
    String text = fromText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double retValue = 0;

    print('to Currency $value * ${fromCurrency.real}');
    switch (toCurrency.name) {
      case 'Real':
        retValue = value * fromCurrency.real;
        break;
      case 'Dolar':
        retValue = value * fromCurrency.dolar;
        break;
      case 'Euro':
        retValue = value * fromCurrency.euro;
        break;
      case 'Bitcoin':
        retValue = value * fromCurrency.bitcoin;
        break;
      default:
        retValue = 0;
    }
    toText.text = retValue.toStringAsFixed(4);
  }
}

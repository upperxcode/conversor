import 'package:conversor/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../components/currency_dropdown.dart';
import '../components/currency_row.dart';
import '../components/custom_textfield.dart';

class HomeView extends StatelessWidget {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  HomeView() {
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 150,
                  height: 150,
                ),
                SizedBox(height: 20),
                CurrencyRow(
                  controller: homeController,
                  selectedItem: homeController.fromCurrency,
                  textController: fromText,
                  onChange: (p) => {homeController.fromCurrency = p, print('resulta ${p.name}')},
                ),
                SizedBox(height: 10),
                CurrencyRow(
                  controller: homeController,
                  selectedItem: homeController.toCurrency,
                  textController: toText,
                  onChange: (p) => {homeController.toCurrency = p, print('resulta ${p.name}')},
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[300]),
                    onPressed: () => homeController.convert(),
                    child: Text('CONVERTER')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



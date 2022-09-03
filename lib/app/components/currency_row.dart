import 'package:conversor/app/models/currency_model.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';
import 'currency_dropdown.dart';
import 'custom_textfield.dart';

class CurrencyRow extends StatelessWidget {
  final CurrencyModel selectedItem;
  final HomeController controller;
  final TextEditingController textController;
  final Function(dynamic) onChange;
  const CurrencyRow({Key? key, required this.selectedItem, required this.controller, required this.textController, required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          flex: 1,
          child: CurrencyDropDown(
            controller: controller,
            selectedItem: selectedItem,
            onChange: onChange,
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          flex: 2,
          child: CustomTextField(
            controller: textController,
            caption: '199,00',
          ),
        ),
      ],
    );
  }
}

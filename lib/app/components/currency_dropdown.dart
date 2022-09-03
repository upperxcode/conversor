import 'package:conversor/app/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import '../models/currency_model.dart';

const List<String> list = <String>['Real', 'Dolar', 'Euro', 'Bitcoin'];

class CurrencyDropDown extends StatefulWidget {
  HomeController controller;
  CurrencyModel selectedItem;
  final Function(dynamic) onChange;
  CurrencyDropDown({Key? key, required this.controller, required this.selectedItem, required this.onChange})
      : super(key: key);

  @override
  State<CurrencyDropDown> createState() => _CurrencyDropDownState();
}

class _CurrencyDropDownState extends State<CurrencyDropDown> {
  late CurrencyModel _selectedItem;
  @override
  void initState() {
    // TODO: implement initState
    _selectedItem = widget.selectedItem;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 57,
      width: 100,
      child: DropdownButton(
        isExpanded: true,
        underline: Container(
          height: 1,
          color: Colors.amber,
        ),
        value: _selectedItem,
        items: widget.controller.currencies.map<DropdownMenuItem<CurrencyModel>>((value) {
          return DropdownMenuItem<CurrencyModel>(
            value: value,
            child: Text(value.name),
          );
        }).toList(),
        onChanged: (CurrencyModel? value) => {
          setState(() {
            _selectedItem = value!;
          }),
          widget.onChange(value!),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SUIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SUIFormState();
  }
}

class _SUIFormState extends State<SUIForm> {
  var _minimumPadding = 5.0;
  var _currency = ["Naira", "Dollars", "Pounds", "Cedis"];
  var _selectedCurrency = "Naira";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(_minimumPadding),
            child: TextField(
              autofocus: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Principal",
                  hintText: "Principal e.g 12000",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(_minimumPadding))),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_minimumPadding),
            child: TextField(
              autofocus: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Interest Rate",
                  hintText: "Interest rate e.g 5.2",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(_minimumPadding))),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(_minimumPadding),
                  child: TextField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Term",
                        hintText: "e.g 6",
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.circular(_minimumPadding))),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(_minimumPadding),
                  child: DropdownButton<String>(
                    items: _currency.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      _selectedCurrency = value;
                    },
                    value: _selectedCurrency,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

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

  //the parameters of the interest
  var _principal = 0.0;
  var _rate = 0.0;
  var _time = 0;
  var _interest = 0.0;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
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
          ),
          Container(
            padding: EdgeInsets.all(_minimumPadding),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    child: Text("Calculate"),
                    onPressed: (){
                      setState(() {
                        _interest = calculateInterest();
                      });
                    },
                  ),
                ),
                Container(width: _minimumPadding * 5,),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    child: Text("Reset"),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_minimumPadding),
            child: Text("Interest is $_interest $_selectedCurrency"),
          )
        ],
      ),
    );
  }

  double calculateInterest() {
      int mTime = _time;
      double mPrincipal = _principal;
      double mRate = _rate;

      var mInterest = (mPrincipal * mRate * mTime)/100;

      return mInterest;
  }
}

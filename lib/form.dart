import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SUIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SUIFormState();
  }
}

class _SUIFormState extends State<SUIForm> {
  var _minimumPadding = 5.0;
  var _currency = ["Naira", "Dollars", "Pounds", "Cedis"];
  var _selectedCurrency = "";

  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selectedCurrency = _currency[0];
  }

  //the parameters of the interest
  var _principal = 0.0;
  var _rate = 0.0;
  var _time = 0;
  var _interest = 0.0;

  //Form controllers
  TextEditingController _prinController = new TextEditingController();
  TextEditingController _rateController = new TextEditingController();
  TextEditingController _timeController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Form(
      key: _formKey,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(_minimumPadding),
            child: TextFormField(
              autofocus: false,
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              validator: (String value){
                String message;
                if(value.isEmpty){
                  message = "Field must not be empty";
//                  try{
//                    double.parse(value);
//                  }catch(e){
//                    message = "Input must be a Valid Number";
//                  }
                }
                return message;
              },
              style: textStyle,
              controller: _prinController,
              decoration: InputDecoration(
                  labelText: "Principal",
                  hintText: "Principal e.g 12000",
                  errorStyle: TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 15.0
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(_minimumPadding))),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_minimumPadding),
            child: TextFormField(
              autofocus: false,
              style: textStyle,
              controller: _rateController,
              keyboardType: TextInputType.number,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              validator: (String value){
                String message;
                if(value.isEmpty){
                  message = "Field must not be empty";
                  try{
                    double.parse(value);
                  }catch(e){
                    message = "Input must be a Valid Number";
                  }
                }
                return message;
              },
              decoration: InputDecoration(
                  labelText: "Interest Rate",
                  hintText: "Interest rate e.g 5.2",
                  errorStyle: TextStyle(
                    color: Colors.yellowAccent,
                    fontSize: 15.0
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(_minimumPadding))),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.all(_minimumPadding),
                  child: TextFormField(
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                    validator: (String value){
                      String message;
                      if(value.isEmpty){
                        message = "Field must not be empty";
                        try{
                          double.parse(value);
                        }catch(e){
                          message = "Input must be a Valid Number";
                        }
                      }
                      return message;
                    },
                    style: textStyle,
                    controller: _timeController,
                    decoration: InputDecoration(
                        labelText: "Term",
                        hintText: "e.g 6",
                        errorStyle: TextStyle(
                            color: Colors.yellowAccent,
                            fontSize: 15.0
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(_minimumPadding))),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(_minimumPadding),
                  child: DropdownButton<String>(
                    style: textStyle,
                    items: _currency.map((String item) {
                      return DropdownMenuItem(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String value) {
                      setState(() {
                        _selectedCurrency = value;
                      });
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
                    color: Theme.of(context).primaryColor,
                    child: Text("Calculate", textScaleFactor: 1.5,),
                    onPressed: (){
                      setState(() {
                        if(_formKey.currentState.validate()){
                          _interest = calculateInterest();
                        }
                      });
                    },
                  ),
                ),
                Container(width: _minimumPadding * 5,),
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    child: Text("Reset", textScaleFactor: 1.5,),
                    onPressed: () {
                      setState(() {
                        reset();
                      });
                    },
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(_minimumPadding),
            child: Text("Interest is $_interest $_selectedCurrency",style: textStyle,),
          )
        ],
      ),
    );
  }

  double calculateInterest() {
      _principal = double.parse(_prinController.text);
      _rate = double.parse(_rateController.text);
      _time = int.parse(_timeController.text);

      var mInterest = (_principal * _rate * _time)/100;
      return mInterest;
  }

  reset(){
    _prinController.text = "";
    _timeController.text = "";
    _rateController.text = "";
    _selectedCurrency = _currency[0];
  }

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.parse(s, (e) => null) != null;
  }
}

import 'package:flutter/material.dart';

class SUIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SUIFormState();
  }
}

class _SUIFormState extends State<SUIForm> {
  var _minimumPadding = 5.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(_minimumPadding),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Principal",
                  hintText: "Principal e.g 12000",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(_minimumPadding)
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}

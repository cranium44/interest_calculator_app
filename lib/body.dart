import 'package:flutter/material.dart';
import 'form.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
         getImageAsset(),
          SUIForm()
        ],
      ),
    );
  }

  Widget getImageAsset() {
    var assetImage = new AssetImage("images/download.png");
    var image = Image(image: assetImage, height: 125.0, width: 125.0,);
    return Container(margin: EdgeInsets.all(50.0), child: image,);
  }

}


import 'package:flutter/material.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          getImageAsset(),
          SUIForm()
        ],
      ),
    );
  }

  Image getImageAsset() {
    var assetImage = new AssetImage("images/download.png");
    var image = Image(image: assetImage,);
    return image;
  }

}


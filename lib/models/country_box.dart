import 'package:flutter/widgets.dart';

class CountryBox {
  double? boxWidth, boxHeight, imageWidth, imageHeight;
  Decoration? boxDecoration;

  CountryBox({
    this.boxWidth = 150,
    this.boxHeight = 20,
    this.imageWidth = 20,
    this.imageHeight = 30,
    this.boxDecoration,
  });
}

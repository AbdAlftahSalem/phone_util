import 'package:flutter/widgets.dart';

class CountryBox {
  double? horizontalCountryPadding, boxHeight, imageWidth, imageHeight;
  Decoration? boxDecoration;
  bool showCountryFlag, showCountryDialCode, showCountryName;

  CountryBox({
    this.horizontalCountryPadding = 16,
    this.boxHeight = 20,
    this.imageWidth = 20,
    this.imageHeight = 30,
    this.boxDecoration,
    this.showCountryDialCode = true,
    this.showCountryFlag = true,
    this.showCountryName = false,
  });
}

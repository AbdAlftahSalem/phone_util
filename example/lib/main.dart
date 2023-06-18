import 'package:flutter/material.dart';
import 'package:phone_util/models/country_box.dart';
import 'package:phone_util/models/phone_model.dart';
import 'package:phone_util/view/phone_util.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: PhoneUtil(
          onInputChanged: (PhoneNumber value) => print(value.phoneNumber),
          separatedWidth: 0,
          countryDecoration: CountryBox(
            boxHeight: 50,
            boxDecoration: const BoxDecoration(
              color: Colors.teal,
            ),
          ),
          inputDecoration: InputDecoration(
            fillColor: Colors.teal,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 18,
            ),
          ),
          countryBoxType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
      ),
    );
  }
}

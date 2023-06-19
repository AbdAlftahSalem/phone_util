import 'package:flutter/material.dart';
import 'package:phone_util/models/country_box.dart';
import 'package:phone_util/models/phone_model.dart';
import 'package:phone_util/view/phone_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              PhoneUtil(
                onInputChanged: (PhoneNumber value) => print(value.phoneNumber),
                separatedWidth: 12,
                countryDecoration: CountryBox(
                  boxHeight: 50,
                  boxDecoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.05),
                        spreadRadius: 5,
                        blurRadius: 0,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),
                inputDecoration: InputDecoration(
                  fillColor: Colors.white10,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 18,
                  ),
                ),
                countryBoxType: PhoneInputSelectorType.BOTTOM_SHEET,
                validator: (p0) {
                  if ((p0 ?? "").isEmpty) {
                    return "III";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

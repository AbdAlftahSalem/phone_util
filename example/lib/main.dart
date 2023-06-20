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
                onInputChanged: (PhoneNumber value) {},
                countryBoxType: PhoneInputSelectorType.BOTTOM_SHEET,
                separatedWidth: 12,
                inputDecoration: InputDecoration(
                  fillColor: Colors.white10,
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
                      color: Colors.red,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 18,
                  ),
                ),
                countryDecoration: CountryBox(),
                countries: const ["PS" , "AF", "AX" , "IS"],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

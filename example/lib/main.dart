import 'package:flutter/material.dart';
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
          separatedWidth: 12,
        ),
      ),
    );
  }
}

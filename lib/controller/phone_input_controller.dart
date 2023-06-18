import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_util/models/country_list.dart';
import 'package:phone_util/models/country_model.dart';
import 'package:phone_util/models/phone_model.dart';

class PhoneInputController extends GetxController {
  late String dialCodeInit;
  Country? selectedCountry;
  PhoneNumber phoneNumber = PhoneNumber();
  List<Country> filterCountry = [];
  String searchCountryString = "";

  PhoneInputController(this.dialCodeInit);

  getInitCountry() {
    if (Countries.countryList
        .where((element) => element["dial_code"] == dialCodeInit)
        .isNotEmpty) {
      selectedCountry = Country.fromJson(Countries.countryList
          .firstWhere((element) => element["dial_code"] == dialCodeInit));

      selectedCountry!.flagUri =
          'packages/phone_util/assets/images/flags/${selectedCountry?.alpha2Code?.toLowerCase()}.png';
    } else {
      throw Exception("Select dial code for start country");
    }
    update();
  }

  onChangeInput(String valueInput, ValueChanged<PhoneNumber> onInputChanged) {
    phoneNumber = PhoneNumber(
      phoneNumber: "${selectedCountry?.dialCode}-$valueInput",
      isoCode: "",
      dialCode: selectedCountry?.dialCode,
    );
    onInputChanged(phoneNumber);

    update();
  }

  void filterCountryMethod(String inputCountrySearch) {
    filterCountry = [];
    searchCountryString = inputCountrySearch;
    final filterCountryMap = Countries.countryList
        .where((element) => element["en_short_name"]
            .toString()
            .toLowerCase()
            .contains(inputCountrySearch.toLowerCase()))
        .toList();

    for (var i in filterCountryMap) {
      filterCountry.add(Country.fromJson(i));
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getInitCountry();
  }
}

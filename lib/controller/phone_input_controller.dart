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
  List<String> countriesInput = [];
  List<Map<String, dynamic>> showCountry = [];

  PhoneInputController({
    required this.dialCodeInit,
    required this.countriesInput,
  });

  getInitCountry() {
    if (showCountry
        .where((element) => element["dial_code"] == dialCodeInit)
        .isNotEmpty) {
      selectedCountry = Country.fromJson(showCountry
          .firstWhere((element) => element["dial_code"] == dialCodeInit));
    } else {
      throw Exception(
          "Select dial code for start country is not in countries data");
    }
    update();
  }

  checkInputCountries() {
    if (countriesInput.isEmpty) {
      showCountry = Countries.countryList;
    } else {
      for (var i in countriesInput) {
        List<Map<String, dynamic>> countriesFiltered = Countries.countryList
            .where((element) => element["alpha_2_code"] == i.toUpperCase())
            .toList();

        if (countriesFiltered.isNotEmpty) {
          showCountry.add(countriesFiltered[0]);
        } else {
          throw Exception("$i code not found .....");
        }
      }
    }

    update();
  }

  changeSelectCountry(
      {required Country newCountry, required BuildContext context}) {
    selectedCountry = newCountry;

    if ((phoneNumber.phoneNumber ?? "").isNotEmpty &&
        (phoneNumber.phoneNumber ?? "").contains("-")) {
      String newPhoneNumber =
          "${selectedCountry?.dialCode}-${phoneNumber.phoneNumber!.toLowerCase().split("-")[1]}";
      phoneNumber = PhoneNumber(
        phoneNumber: newPhoneNumber,
        isoCode: "",
        dialCode: selectedCountry?.dialCode,
      );
    }
    resetFilter();
    update();
    Navigator.pop(context);
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
    resetFilter();
    searchCountryString = inputCountrySearch;
    final filterCountryMap = showCountry
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

  void resetFilter() {
    filterCountry = [];
    searchCountryString = "";
    update();
  }

  @override
  void onInit() {
    super.onInit();
    checkInputCountries();
    getInitCountry();
  }
}

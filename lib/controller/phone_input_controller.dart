import 'package:get/get.dart';
import 'package:phone_util/models/country_list.dart';
import 'package:phone_util/models/country_model.dart';

class PhoneInputController extends GetxController {
  late String dialCodeInit;
  Country? selectedCountry;

  PhoneInputController(this.dialCodeInit);

  getInitCountry() {
    if (Countries.countryList
        .where((element) => element["dial_code"] == dialCodeInit)
        .isNotEmpty) {
      selectedCountry = Country.fromJson(Countries.countryList
          .firstWhere((element) => element["dial_code"] == dialCodeInit));

      selectedCountry!.flagUri =
          'packages/phone_util/assets/images/flags/${selectedCountry?.alpha2Code?.toLowerCase()}.png';
      print(selectedCountry!.flagUri);
    } else {
      throw Exception("Select dial code for start country");
    }
    update();
  }

  changeSelectCountry(Country? inputCountry) {
    selectedCountry = inputCountry;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getInitCountry();
  }
}

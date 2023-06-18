import 'package:flutter/material.dart';
import 'package:phone_util/models/country_model.dart';

class CountryItemWidget extends StatelessWidget {
  final Country country;
  final Function(BuildContext context, Country newCountry) onChangeCountry;

  const CountryItemWidget({
    Key? key,
    required this.country,
    required this.onChangeCountry,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(country.flagUri),
      ),
      title: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          country.name ?? "",
          textDirection: Directionality.of(context),
          textAlign: TextAlign.start,
        ),
      ),
      subtitle: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          country.dialCode ?? '',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.start,
        ),
      ),
      onTap: () => onChangeCountry(
        context,
        country,
      ),
    );
  }
}

# phone_util

This pakage help you to build phone input filed with easy step ,
you can change country and seperate country box style as you want and phone input field as you want
. you can add empty space between country and phone field.

## Deployment

you can manually add dio into the dependencies section in your pubspec.yaml:

```bash
  dependencies:
    phone_util: ^replace-with-latest-version
```

Or you can use the command to add dio as a dependency with the latest stable version:

```bash
  dart pub phone_util 
```

## Country box type

- Dialog

 ```bash
   countryBoxType : PhoneInputSelectorType.DIALOG, 
```

- Bottom sheet

 ```bash
   countryBoxType : PhoneInputSelectorType.BOTTOM_SHEET, 
```

## Required Parameters

| Parameter         | Type                            | Description                     |
|:------------------|:--------------------------------|:--------------------------------|
| onInputChanged    | `Function( PhoneNumber value )` | To get every number input       |
| countryDecoration | CountryBox                      | To add style to the country box |

## Example

```dart
import 'package:phone_util/view/phone_util.dart';

@PhoneUtil(
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
)
```

## Authors

- Github  : [@AbdAlftahSalem](https://github.com/AbdAlftahSalem)

- LinkedIn : [Abd Alftah Salem](https://www.linkedin.com/in/abd-alftah-salem-a3ba0b1bb/)


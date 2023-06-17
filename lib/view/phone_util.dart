import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phone_util/controller/phone_input_controller.dart';
import 'package:phone_util/models/country_box.dart';
import 'package:phone_util/models/phone_model.dart';

class PhoneUtil extends StatelessWidget {
  final ValueChanged<PhoneNumber> onInputChanged;
  final ValueChanged<bool>? onInputValidated;

  final VoidCallback? onSubmit;
  final ValueChanged<String>? onFieldSubmitted;
  final String? Function(String?)? validator;
  final ValueChanged<PhoneNumber>? onSaved;

  final Key? fieldKey;
  final TextEditingController? textFieldController;
  final TextInputType keyboardType;
  final TextInputAction? keyboardAction;

  final PhoneNumber? initialValue;
  final String? hintText;
  final String? errorMessage;

  final double selectorButtonOnErrorPadding;

  /// Ignored if [setSelectorButtonAsPrefixIcon = true]
  final double spaceBetweenSelectorAndTextField;
  final int maxLength;

  final bool isEnabled;
  final bool formatInput;
  final bool autoFocus;
  final bool autoFocusSearch;
  final AutovalidateMode autoValidateMode;
  final bool ignoreBlank;
  final bool countrySelectorScrollControlled;

  final String? locale;

  final TextStyle? textStyle;
  final TextStyle? selectorTextStyle;
  final InputBorder? inputBorder;
  final InputDecoration? inputDecoration;
  final InputDecoration? searchBoxDecoration;
  final Color? cursorColor;
  final TextAlign textAlign;
  final TextAlignVertical textAlignVertical;
  final EdgeInsets scrollPadding;

  final FocusNode? focusNode;
  final Iterable<String>? autofillHints;

  final List<String>? countries;
  final String? dialCodeInit;
  final double separatedWidth;
  final TextEditingController? controller;
  final CountryBox? countryDecoration;

  const PhoneUtil({
    Key? key,
    required this.onInputChanged,
    this.onInputValidated,
    this.onSubmit,
    this.onFieldSubmitted,
    this.validator,
    this.onSaved,
    this.fieldKey,
    this.textFieldController,
    this.keyboardAction,
    this.keyboardType = TextInputType.phone,
    this.initialValue,
    this.hintText = 'Phone number',
    this.errorMessage = 'Invalid phone number',
    this.selectorButtonOnErrorPadding = 24,
    this.spaceBetweenSelectorAndTextField = 12,
    this.maxLength = 15,
    this.isEnabled = true,
    this.formatInput = true,
    this.autoFocus = false,
    this.autoFocusSearch = false,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.ignoreBlank = false,
    this.countrySelectorScrollControlled = true,
    this.locale,
    this.textStyle,
    this.selectorTextStyle,
    this.inputBorder,
    this.inputDecoration,
    this.searchBoxDecoration,
    this.textAlign = TextAlign.start,
    this.textAlignVertical = TextAlignVertical.center,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.focusNode,
    this.cursorColor,
    this.autofillHints,
    this.dialCodeInit,
    this.countries,
    required this.separatedWidth,
    this.controller,
    this.countryDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhoneInputController>(
        init: PhoneInputController(dialCodeInit ?? "+970"),
        builder: (ctrl) {
          return Row(
            children: [
              Container(
                decoration: countryDecoration?.boxDecoration,
                child: Row(
                  children: [
                    Image.asset(
                      ctrl.selectedCountry!.flagUri,
                      width: countryDecoration?.imageWidth ?? 24,
                      height: countryDecoration?.imageWidth ?? 24,
                    ),
                    Text(ctrl.selectedCountry?.name ?? ""),
                  ],
                ),
              ),
              SizedBox(width: separatedWidth),
              Expanded(
                child: TextFormField(
                  textDirection: TextDirection.ltr,
                  controller: controller,
                  cursorColor: cursorColor,
                  focusNode: focusNode,
                  enabled: isEnabled,
                  autofocus: autoFocus,
                  keyboardType: keyboardType,
                  textInputAction: keyboardAction,
                  style: textStyle,
                  decoration: inputDecoration,
                  textAlign: textAlign,
                  textAlignVertical: textAlignVertical,
                  onEditingComplete: onSubmit,
                  onFieldSubmitted: onFieldSubmitted,
                  autovalidateMode: autoValidateMode,
                  autofillHints: autofillHints,
                  // validator: validator ?? state.validator,
                  // onSaved: state.onSaved,
                  scrollPadding: scrollPadding,
                  // inputFormatters: [
                  //   LengthLimitingTextInputFormatter(widget.maxLength),
                  //   widget.formatInput
                  //       ? AsYouTypeFormatter(
                  //           isoCode: countryCode,
                  //           dialCode: dialCode,
                  //           onInputFormatted: (TextEditingValue value) {
                  //             state.controller!.value = value;
                  //           },
                  //         )
                  //       : FilteringTextInputFormatter.digitsOnly,
                  // ],
                  onChanged: (value)=> ctrl.onChangeInput(value, onInputChanged),
                ),
              )
            ],
          );
        });
  }
}

class PhoneNumber {
  /// Either formatted or unformatted String of the phone number
  final String? phoneNumber;

  /// The Country [dialCode] of the phone number
  final String? dialCode;

  /// Country [isoCode] of the phone number
  final String? isoCode;

  PhoneNumber({
    this.phoneNumber,
    this.dialCode,
    this.isoCode,
  });
}

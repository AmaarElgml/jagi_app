import '../../constants.dart';

class Address {
  String city;
  String addressText;
  String state;
  String zipCode;

  Address(
      {required this.addressText,
      required this.city,
      required this.state,
      required this.zipCode});

  Address.fromMap(Map<String, dynamic> data)
      : city = data[kCity],
        addressText = data[kAddressText],
        state = data[kState],
        zipCode = data[kZipCode];

  toMap() => {
        kCity: city,
        kAddressText: addressText,
        kState: state,
        kZipCode: zipCode
      };
}

import '../../constants.dart';

class PaymentCard {
  String cardNumber;
  String expiration;
  String securityCode;

  PaymentCard(
      {required this.cardNumber,
      required this.expiration,
      required this.securityCode});

  PaymentCard.fromMap(Map<String, dynamic> data)
      : cardNumber = data[kCardNumber],
        expiration = data[kExpiration],
        securityCode = data[kSecurityCode];

  toMap() => {
        kCardNumber: cardNumber,
        kExpiration: expiration,
        kSecurityCode: securityCode
      };
}

import 'product.dart';
import 'payment_card.dart';
import 'address.dart';
import '../../constants.dart';

class Order {
  String? id;
  String totalPrice;
  Address address;
  PaymentCard card;
  List<Product> products;

  Order(
      {this.id,
      required this.totalPrice,
      required this.address,
      required this.card,
      required this.products});

  Order.fromMap(Map<String, dynamic> data)
      : id = data[kOrderID],
        totalPrice = data[kTotalPrice],
        address = Address.fromMap(data[kAddress]),
        card = PaymentCard.fromMap(data[kPaymentCard]),
        products = [];

  Map<String, dynamic> toMap() => {
        kOrderID: id,
        kTotalPrice: totalPrice,
        kAddress: address.toMap(),
        kPaymentCard: card.toMap()
      };
}

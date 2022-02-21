import 'package:flutter/material.dart';
import 'package:jagi_app/model/pojo/address.dart';
import 'package:jagi_app/model/pojo/order.dart';
import 'package:jagi_app/model/pojo/payment_card.dart';
import 'package:jagi_app/model/pojo/product.dart';
import 'package:jagi_app/model/services/store.dart';

class CheckoutViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Store _store = Store();
  String totalPrice = '';
  List<Product> products = [];
  late String addressText, city, state, zipCode, cardNumber, expiration, sCode;

  int currentStep = 0;
  bool complete = false;



  storeOrder() {
    Address address = Address(addressText: addressText, city: city, state: state, zipCode: zipCode);
    PaymentCard card = PaymentCard(cardNumber: cardNumber, expiration: expiration, securityCode: sCode);
    _store.storeOrders(Order(
      address: address,
      card: card,
      products: products,
      totalPrice: totalPrice,
    ));

    products.clear();
  }

  validateFields(TextEditingController controller) {}
}

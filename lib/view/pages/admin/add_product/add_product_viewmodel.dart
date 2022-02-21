import 'package:flutter/material.dart';
import 'package:jagi_app/model/pojo/product.dart';
import 'package:jagi_app/model/services/store.dart';

class AddProductViewModel {
  final _store = Store();
  late String name, desc, category, price, location;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  void addProduct() {
    Product product = Product(name: name, description: desc, category: category, price: price, image: location);
    _store.addProduct(product);
  }
}

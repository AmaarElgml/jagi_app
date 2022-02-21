import 'package:flutter/material.dart';
import 'package:jagi_app/model/pojo/product.dart';
import 'package:jagi_app/model/services/store.dart';

class EditProductViewModel {
  final _store = Store();
  late Product product;
  late String name, desc, category, price, location;
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final TextEditingController nameText = TextEditingController();
  final TextEditingController descText = TextEditingController();
  final TextEditingController categoryText = TextEditingController();
  final TextEditingController priceText = TextEditingController();
  final TextEditingController locationText = TextEditingController();
  bool first = true;

  setFieldsData() {
    nameText.text = product.name;
    descText.text = product.description;
    categoryText.text = product.category;
    priceText.text = product.price;
    locationText.text = product.image;
  }

  void editProduct() {
    _store.editProduct(
        documentId: product.id!,
        data: (Product(name: name, description: desc, category: category, price: price, image: location)));
  }
}

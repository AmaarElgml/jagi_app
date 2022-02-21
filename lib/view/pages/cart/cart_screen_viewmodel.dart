import 'package:jagi_app/model/pojo/product.dart';

class CartScreenViewModel {
  List<Product> products = [];
  List<String> selectedItemValue = [];

  void setDefaultQuantities() {
    selectedItemValue.clear();
    for (int i = 0; i < products.length; i++) {
      selectedItemValue.add('1');
    }
  }

  void removeProduct(index) {
    products.removeAt(index);
  }

  String calcPrice() {
    double total = 0;
    for (int i = 0; i < products.length; i++) {
      total +=
          double.parse(products[i].price) * (selectedItemValue.isNotEmpty ? double.parse(selectedItemValue[i]) : 1);
    }
    return total.toStringAsFixed(2);
  }
}

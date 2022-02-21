import '../../constants.dart';

class Product {
  String? id;
  String name;
  String price;
  String description;
  String category;
  String image;
  String quantity;

  Product(
      {this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.category,
      required this.image,
      this.quantity = '1'});

  Product.fromMap(Map<String, dynamic> data)
      : id = data[kProductID],
        name = data[kProductName],
        price = data[kProductPrice],
        description = data[kProductDescription],
        category = data[kProductCategory],
        image = data[kProductImage],
        quantity = data[kProductQuantity];

  toMap() => {
        kProductID: id,
        kProductName: name,
        kProductPrice: price,
        kProductDescription: description,
        kProductCategory: category,
        kProductImage: image,
        kProductQuantity: quantity
      };
}

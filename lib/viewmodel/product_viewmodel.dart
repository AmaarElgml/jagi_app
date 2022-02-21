import 'package:jagi_app/model/pojo/product.dart';

class ProductViewModel {
  Product? product;

  ProductViewModel({this.product});

  get id => product?.id;

  get name => product?.name;

  get price => product?.price;

  get description => product?.description;

  get category => product?.category;

  get location => product?.image;

  get quantity => product?.quantity;
}

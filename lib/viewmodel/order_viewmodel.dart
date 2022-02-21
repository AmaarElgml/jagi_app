import 'package:jagi_app/model/pojo/order.dart';

class OrderViewModel {
  Order? order;

  OrderViewModel({this.order});

  get id => order?.id;

  get totalPrice => order?.totalPrice;

  get address => order?.address;

  get card => order?.card;

  get products => order?.products;
}

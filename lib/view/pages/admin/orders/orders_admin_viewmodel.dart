import 'package:jagi_app/model/services/store.dart';

class OrdersAdminViewModel {
  final _store = Store();

  loadOrders() {
    return _store.loadOrders();
  }


}
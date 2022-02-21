import 'package:jagi_app/model/services/store.dart';

class ManageProductsViewModel {
  final _store = Store();

  loadProducts() {
    return _store.loadProducts();
  }

  deleteProduct(id) {
    return _store.deleteProduct(id);
  }

}

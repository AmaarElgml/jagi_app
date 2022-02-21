import 'package:firebase_auth/firebase_auth.dart';
import 'package:jagi_app/model/pojo/product.dart';
import 'package:jagi_app/model/services/auth.dart';
import 'package:jagi_app/model/services/store.dart';

class HomeScreenViewModel {
  final Auth _auth = Auth();
  final Store _store = Store();
  User? loggedUser;
  List<Product> products = [];

  getCurrentUser() {
    loggedUser = _auth.getUser();
  }

  getProducts() {
    return _store.loadProducts();
  }

  final List<String> titles = [
    'Coats',
    'Jackets',
    'T-shirts',
    'Shoes',
  ];
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jagi_app/model/pojo/order.dart';
import 'package:jagi_app/model/pojo/product.dart';
import '../../constants.dart';

class Store {
  final _store = FirebaseFirestore.instance;

  addProduct(Product product) {
    _store.collection(kProductCollection).add({
      kProductName: product.name,
      kProductPrice: product.price,
      kProductDescription: product.description,
      kProductCategory: product.category,
      kProductImage: product.image,
    });
  }

  Stream<QuerySnapshot> loadProducts() => _store.collection(kProductCollection).snapshots();

  deleteProduct(String documentId) {
    _store.collection(kProductCollection).doc(documentId).delete();
  }

  editProduct({required String documentId, required data}) {
    _store.collection(kProductCollection).doc(documentId).update(data);
  }

  storeOrders(Order order) {
    var documentRef = _store.collection(kOrders).doc();
    order.id = documentRef.id;
    order.products.forEach((product) {
      documentRef.collection(kProductCollection).add(product.toMap());
    });
    documentRef.set(order.toMap());
  }

  Stream<QuerySnapshot> loadOrders() => _store.collection(kOrders).snapshots();

  Stream<QuerySnapshot> loadOrderProducts(documentID) =>
      _store.collection(kOrders).doc(documentID).collection(kProductCollection).snapshots();
}

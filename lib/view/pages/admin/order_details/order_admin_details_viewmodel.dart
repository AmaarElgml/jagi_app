import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jagi_app/model/services/store.dart';

class OrderAdminDetailsViewModel {
  final _store = Store();

   Stream<QuerySnapshot> loadOrderProducts(documentId) {
    return _store.loadOrderProducts(documentId);
  }
}

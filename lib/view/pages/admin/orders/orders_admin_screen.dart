import 'package:jagi_app/model/pojo/address.dart';
import 'package:jagi_app/model/pojo/order.dart';
import 'package:jagi_app/model/pojo/payment_card.dart';
import 'package:jagi_app/model/pojo/product.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jagi_app/constants.dart';
import '../order_details/order_admin_details.dart';
import 'orders_admin_viewmodel.dart';

class OrdersAdminScreen extends StatelessWidget {
  static String id = 'OrdersAdminScreen.id';
  final OrdersAdminViewModel viewModel = OrdersAdminViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kLightGray,
        appBar: AppBar(title: Text('Orders')),
        body: StreamBuilder<QuerySnapshot>(
            stream: viewModel.loadOrders(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: Text('There is no orders!', style: TextStyle(color: kLightGray, fontSize: 20)));
              } else {
                List<Order> orders = [];
                for (var doc in snapshot.data!.docs) {
                  List<Product> products = [];
                  orders.add(Order(
                      id: doc.id,
                      card: PaymentCard.fromMap(doc[kPaymentCard]),
                      products: products,
                      address: Address.fromMap(doc[kAddress]),
                      totalPrice: doc[kTotalPrice]));
                }
                return ListView.builder(
                    itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: defSpacing, vertical: defSpacing / 2),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, OrderAdminDetails.id, arguments: orders[index].id);
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height * .15,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(defSpacing),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 3))
                                    ]),
                                padding: EdgeInsets.all(defSpacing / 2),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text('Total Price = \$${orders[index].totalPrice}',
                                          style: TextStyle(letterSpacing: 2, color: Colors.black, fontSize: 20)),
                                      SizedBox(height: defSpacing / 2),
                                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                        Text('City: ${orders[index].address.city}',
                                            style: TextStyle(fontSize: 18, color: kDark)),
                                        SizedBox(width: defSpacing),
                                        Text('State: ${orders[index].address.state}',
                                            style: TextStyle(fontSize: 18, color: kDark))
                                      ])
                                    ])))),
                    itemCount: orders.length);
              }
            }));
  }
}

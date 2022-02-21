import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jagi_app/model/pojo/product.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:jagi_app/view/widgets/custom_widgets.dart';
import '../../../../constants.dart';
import 'order_admin_details_viewmodel.dart';

class OrderAdminDetails extends StatelessWidget {
  static String id = 'OrderAdminDetails.id';
  final OrderAdminDetailsViewModel viewModel = OrderAdminDetailsViewModel();

  @override
  Widget build(BuildContext context) {
    String documentId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        backgroundColor: kLightGray,
        appBar: AppBar(title: Text('Order Products')),
        body: StreamBuilder<QuerySnapshot>(
            stream: viewModel.loadOrderProducts(documentId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> products = [];
                for (var doc in snapshot.data!.docs) {
                  products.add(Product(
                    id: doc.id,
                    name: doc[kProductName],
                    category: doc[kProductCategory],
                    price: doc[kProductPrice],
                    image: doc[kProductImage],
                    quantity: doc[kProductQuantity],
                    description: doc[kProductDescription],
                  ));
                }
                return Column(children: <Widget>[
                  Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(horizontal: defSpacing, vertical: defSpacing / 2),
                              child: Container(
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
                                  height: MediaQuery.of(context).size.height * .16,
                                  child: Padding(
                                      padding: EdgeInsets.all(defSpacing / 2),
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text('Name : ${products[index].name}',
                                                style: TextStyle(color: Colors.black, fontSize: 20)),
                                            SizedBox(height: defSpacing / 2),
                                            Text('Quantity : ${products[index].quantity}',
                                                style: TextStyle(fontSize: 18, color: kDark)),
                                            SizedBox(height: defSpacing / 2),
                                            Text('Category : ${products[index].category}',
                                                style: TextStyle(fontSize: 18, color: kDark))
                                          ])))),
                          itemCount: products.length)),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: defSpacing, vertical: defSpacing / 2),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                        Expanded(child: CustomButton(onPressed: () {}, title: 'Confirm Order')),
                        SizedBox(width: defSpacing / 2),
                        Expanded(child: CustomButton(onPressed: () {}, title: 'Delete Order')),
                      ]))
                ]);
              } else {
                return Center(child: Text('Loading Order Details'));
              }
            }));
  }
}

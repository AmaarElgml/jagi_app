import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jagi_app/model/pojo/product.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:jagi_app/view/pages/admin/edit_product/edit_products_screen.dart';
import 'package:jagi_app/view/widgets/custom_pop_menu_item.dart';
import 'package:jagi_app/view/widgets/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import 'manage_products_viewmodel.dart';

class ManageProductsScreen extends StatelessWidget {
  static String id = 'ManageProductsScreen.id';
  final ManageProductsViewModel viewModel = ManageProductsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(right: defSpacing * .75),
            child: StreamBuilder<QuerySnapshot>(
                stream: viewModel.loadProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Product> _products = [];
                    for (var document in snapshot.data!.docs) {
                      _products.add(Product(
                        id: document.id,
                        name: document[kProductName],
                        category: document[kProductCategory],
                        price: document[kProductPrice],
                        description: document[kProductDescription],
                        image: document[kProductImage],
                      ));
                    }
                    return GridView.builder(
                        gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .65),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTapUp: (details) {
                                double dx = details.globalPosition.dx;
                                double dy = details.globalPosition.dy;
                                double dx2 = MediaQuery.of(context).size.width - dx;
                                double dy2 = MediaQuery.of(context).size.width - dy;
                                showMenu(context: context, position: RelativeRect.fromLTRB(dx, dy, dx2, dy2), items: [
                                  CustomPopMenuItem(
                                      child: Text('Edit'),
                                      onPressed: () {
                                        Navigator.pushNamed(context, EditProductScreen.id, arguments: _products[index]);
                                      }),
                                  CustomPopMenuItem(
                                      child: Text('Delete'),
                                      onPressed: () {
                                        viewModel.deleteProduct(_products[index].id!);
                                        Navigator.pop(context);
                                      })
                                ]);
                              },
                              child: ProductModel(product: _products[index]));
                        },
                        itemCount: _products.length);
                  } else {
                    return Center(child: Text('Loading...', style: TextStyle(color: Colors.black)));
                  }
                })));
  }
}

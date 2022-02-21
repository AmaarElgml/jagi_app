import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:jagi_app/view/widgets/custom_widgets.dart';
import 'package:jagi_app/view/widgets/order_card_item.dart';
import 'package:provider/provider.dart';
import 'package:jagi_app/provider/cart_item.dart';
import '../checkout/checkout_screen.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'cart_screen_viewmodel.dart';

class CartScreen extends StatefulWidget {
  static String id = 'CartScreen.id';

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartScreenViewModel viewModel = CartScreenViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.products = Provider.of<CartItem>(context).products;
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: defSpacing * 1.5, vertical: defSpacing),
            child: ListView(children: [
              viewModel.products.isNotEmpty
                  ? ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: viewModel.products.length,
                          itemBuilder: (context, index) {
                            viewModel.setDefaultQuantities();
                            return Slidable(
                                key: ValueKey(0),
                                startActionPane: ActionPane(
                                    motion: ScrollMotion(),
                                    dismissible: DismissiblePane(onDismissed: () {}),
                                    children: [
                                      SlidableAction(
                                          label: 'Delete',
                                          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                                          icon: Icons.delete,
                                          foregroundColor: Colors.red,
                                          onPressed: (BuildContext context) {
                                            viewModel.removeProduct(index);
                                            setState(() {});
                                          })
                                    ]),
                                child: CardItem(
                                    product: viewModel.products[index],
                                    selectedNumber: viewModel.selectedItemValue[index],
                                    afterChangeQuantity: (value) {
                                      if (value == null) return;
                                      setState(() {
                                        viewModel.selectedItemValue[index] = value;
                                        viewModel.products[index].quantity = viewModel.selectedItemValue[index];
                                      });
                                    }));
                          }))
                  : Center(
                      child: Container(
                          padding: EdgeInsets.only(top: defSpacing * 10),
                          child: Text('Your cart is empty', style: TextStyle(color: kDark, fontSize: 20)))),
              SizedBox(height: defSpacing / 2),
              viewModel.products.isNotEmpty ? customDivider : SizedBox(),
              SizedBox(height: defSpacing / 2),
              viewModel.products.isNotEmpty
                  ? Padding(
                      padding: EdgeInsets.all(defSpacing / 2),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text('Total', style: TextStyle(fontSize: 20, color: Colors.black38)),
                        Text('\$${viewModel.calcPrice()}',
                            style: TextStyle(letterSpacing: 2, fontSize: 22, color: Colors.black))
                      ]))
                  : SizedBox(),
              SizedBox(height: defSpacing),
              viewModel.products.isNotEmpty
                  ? CustomButton(
                      title: 'Confirm',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CheckoutScreen(products: viewModel.products, totalPrice: viewModel.calcPrice()),
                            ));
                      })
                  : SizedBox(),
            ])));
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

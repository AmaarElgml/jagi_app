import 'package:jagi_app/model/pojo/product.dart';
import 'package:jagi_app/provider/cart_item.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:jagi_app/view/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class ProductInfoScreen extends StatelessWidget {
  static String id = 'ProductInfoScreen.id';

  @override
  Widget build(BuildContext context) {
    Product product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
        appBar: AppBar(title: Text(product.name)),
        backgroundColor: Colors.white.withOpacity(0.9),
        floatingActionButton: CustomButton(
            title: 'Add to card'.toUpperCase(),
            onPressed: () {
              addToCart(context, product);
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: defSpacing, vertical: defSpacing),
            child: ListView(children: [
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image(fit: BoxFit.contain, image: NetworkImage(product.image))),
              SizedBox(height: defSpacing / 2),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                      trailing: Text('\$${product.price}',
                          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                      subtitle: Text('${product.description}.', style: TextStyle(color: KColor2, fontSize: 16))))
            ])));
  }

  void addToCart(context, Product product) {
    CartItem cartItem = Provider.of<CartItem>(context, listen: false);
    bool exist = false;
    var productsInCart = cartItem.products;
    for (var productInCart in productsInCart) {
      if (productInCart.name == product.name) {
        exist = true;
      }
    }
    if (exist)
      showSnackBar(context, 'you\'ve added this item before');
    else {
      cartItem.addProduct(product);
      showSnackBar(context, 'Added to Cart');
    }
  }
}

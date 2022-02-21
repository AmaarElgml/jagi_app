import 'package:jagi_app/model/pojo/product.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductModel extends StatelessWidget {
  ProductModel({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Stack(fit: StackFit.expand, children: [
      Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(product.image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10.0))),
      Positioned(
          bottom: 0,
          child: Opacity(
              opacity: .6,
              child: Container(
                  height: 60,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        Text('\$${product.price}',
                            style: TextStyle(
                                color: KColor1,
                                fontSize: 18,
                                fontWeight: FontWeight.bold))
                      ]))))
    ]);
  }
}

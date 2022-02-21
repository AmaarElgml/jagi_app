import 'package:flutter/material.dart';
import 'package:jagi_app/model/pojo/product.dart';
import 'package:jagi_app/styles/app_theme.dart';

class CardItem extends StatelessWidget {
  CardItem({required this.product, required this.selectedNumber, required this.afterChangeQuantity});

  final Product product;
  final String selectedNumber;
  final Function afterChangeQuantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: defSpacing * 0.75, horizontal: defSpacing / 2),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.25,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(product.image), fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(defSpacing / 2))),
          SizedBox(width: defSpacing / 1.25),
          Expanded(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(product.name, style: TextStyle(fontSize: 14, color: Colors.black54)),
              SizedBox(height: defSpacing / 2),
              Text(product.category, style: TextStyle(fontSize: 12, color: Colors.black38))
            ]),
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('\$${product.price}', style: TextStyle(color: Colors.black, letterSpacing: 2, fontSize: 18)),
              SizedBox(height: defSpacing / 2),
              GestureDetector(
                  onTapUp: (details) {
                    double dx = details.globalPosition.dx;
                    double dy = details.globalPosition.dy;
                    double dx2 = MediaQuery.of(context).size.width - dx;
                    double dy2 = MediaQuery.of(context).size.width - dy;
                    _showMenu(context, dx, dy, dx2, dy2).then((value) {
                      afterChangeQuantity(value);
                    });
                  },
                  child: Container(
                      width: 55,
                      height: 35,
                      decoration: BoxDecoration(color: kLightGray, borderRadius: BorderRadius.circular(defSpacing / 2)),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(selectedNumber),
                            SizedBox(width: defSpacing / 8),
                            Icon(Icons.keyboard_arrow_down_sharp)
                          ])))
            ])
          ]))
        ]));
  }

  final optionsForSelect = ['1', '2', '3', '4', '5'];

  Future<String?> _showMenu(context, double dx, double dy, double dx2, double dy2) {
    return showMenu<String>(
        context: context,
        position: RelativeRect.fromLTRB(dx, dy - 10, dx2, dy2 + 10),
        items: [
          ...optionsForSelect.map((e) => PopupMenuItem<String>(child: Text(e), value: e)),
        ],
        elevation: 8.0);
  }
}

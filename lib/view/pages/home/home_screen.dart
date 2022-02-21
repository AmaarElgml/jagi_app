import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jagi_app/model/pojo/product.dart';
import 'package:jagi_app/view/pages/product_info/product_info_screen.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:jagi_app/view/widgets/custom_widgets.dart';
import 'package:jagi_app/view/widgets/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import 'home_screen_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'HomeScreen.id';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeScreenViewModel viewModel = HomeScreenViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(0.0),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: defSpacing),
                        child: TabBar(
                            indicator: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(defSpacing * 1.25),
                                color: primaryColor.withOpacity(.8)),
                            labelColor: Colors.white,
                            unselectedLabelColor: KColor1,
                            tabs: [
                              ...viewModel.titles
                                  .map((title) => Tab(text: title))
                            ])))),
            body: TabBarView(children: <Widget>[
              ...viewModel.titles.map((title) => productsView(title))
            ])));
  }

  productsView(String productCategory) {
    return Padding(
        padding: EdgeInsets.fromLTRB(
            defSpacing * 0.75, defSpacing, defSpacing * 0.75, 0),
        child: StreamBuilder<QuerySnapshot>(
            stream: viewModel.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Product> products = [];
                for (var document in snapshot.data!.docs) {
                  products.add(Product(
                      id: document.id,
                      name: document[kProductName],
                      category: document[kProductCategory],
                      price: document[kProductPrice],
                      description: document[kProductDescription],
                      image: document[kProductImage]));
                }
                viewModel.products = [...products];
                products.clear();
                for (var product in viewModel.products)
                  if (product.category == productCategory)
                    products.add(product);

                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .65,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ProductInfoScreen.id,
                                arguments: products[index]);
                          },
                          child: ProductModel(product: products[index]));
                    },
                    itemCount: products.length);
              } else
                return CustomCircularProgress(Colors.indigo);
            }));
  }
}

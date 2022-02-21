import 'package:jagi_app/model/pojo/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:jagi_app/view/widgets/custom_widgets.dart';
import 'edit_product_viewmodel.dart';

class EditProductScreen extends StatelessWidget {
  static String id = 'EditProductScreen.id';
  final EditProductViewModel viewModel = EditProductViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.product = ModalRoute.of(context)!.settings.arguments as Product;

    if (viewModel.first) {
      viewModel.setFieldsData();
      viewModel.first = false;
    }
    return Scaffold(
        body: Form(
            key: viewModel.globalKey,
            child: ListView(children: [
              SizedBox(height: MediaQuery.of(context).size.height * .2),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomTextField(
                    hint: 'Product name',
                    controller: viewModel.nameText,
                    iconData: Icons.circle,
                    onSaved: (value) {
                      viewModel.name = value;
                    }),
                SizedBox(height: defSpacing / 2),
                CustomTextField(
                    hint: 'Product description',
                    controller: viewModel.descText,
                    iconData: Icons.circle,
                    onSaved: (value) {
                      viewModel.desc = value;
                    }),
                SizedBox(height: defSpacing / 2),
                CustomTextField(
                    hint: 'Product category',
                    controller: viewModel.categoryText,
                    iconData: Icons.circle,
                    onSaved: (value) {
                      viewModel.category = value;
                    }),
                SizedBox(height: defSpacing / 2),
                CustomTextField(
                    hint: 'Product price',
                    controller: viewModel.priceText,
                    iconData: Icons.circle,
                    onSaved: (value) {
                      viewModel.price = value;
                    }),
                SizedBox(height: defSpacing / 2),
                CustomTextField(
                    hint: 'Product location',
                    controller: viewModel.locationText,
                    iconData: Icons.circle,
                    onSaved: (value) {
                      viewModel.location = value;
                    }),
                SizedBox(height: defSpacing * 1.5),
                CustomButton(
                    title: 'Submit',
                    onPressed: () {
                      _validate(context);
                    })
              ])
            ])));
  }

  _validate(context) {
    if (viewModel.globalKey.currentState!.validate()) {
      viewModel.globalKey.currentState!.save();
      viewModel.editProduct();
      Navigator.pop(context);
      Navigator.pop(context);
    }
  }
}

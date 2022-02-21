import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:jagi_app/view/pages/admin/add_product/add_product_viewmodel.dart';
import 'package:jagi_app/view/widgets/custom_widgets.dart';

class AddProductScreen extends StatelessWidget {
  static String id = 'AddProduct.id';
  final AddProductViewModel viewModel = AddProductViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Add Product'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                })),
        body: Form(
            key: viewModel.globalKey,
            child: Padding(
                padding: EdgeInsets.all(defSpacing * 1.5),
                child: ListView(children: [
                  CustomTextField(
                      hint: 'Product name',
                      iconData: Icons.drive_file_rename_outline,
                      onSaved: (value) {
                        viewModel.name = value;
                      }),
                  SizedBox(height: defSpacing),
                  CustomTextField(
                      hint: 'Product description',
                      iconData: Icons.description_outlined,
                      onSaved: (value) {
                        viewModel.desc = value;
                      }),
                  SizedBox(height: defSpacing),
                  CustomTextField(
                      hint: 'Product category',
                      iconData: Icons.category_outlined,
                      onSaved: (value) {
                        viewModel.category = value;
                      }),
                  SizedBox(height: defSpacing),
                  CustomTextField(
                      hint: 'Product price',
                      iconData: Icons.monetization_on_outlined,
                      onSaved: (value) {
                        viewModel.price = value;
                      }),
                  SizedBox(height: defSpacing),
                  CustomTextField(
                      hint: 'Product location',
                      iconData: Icons.image,
                      onSaved: (value) {
                        viewModel.location = value;
                      }),
                  SizedBox(height: defSpacing * 2),
                  CustomButton(
                      title: 'Submit',
                      onPressed: () {
                        _validate();
                      })
                ]))));
  }

  _validate() {
    if (viewModel.globalKey.currentState!.validate()) {
      viewModel.globalKey.currentState!.save();
      viewModel.addProduct();
    }
  }
}

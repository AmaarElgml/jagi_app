import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/material.dart';

import 'admin_roles_viewmodel.dart';

class AdminRolesScreen extends StatelessWidget {
  static String id = 'AdminRolesScreen.id';

  final AdminRolesViewModel viewModel = AdminRolesViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Admins Roles')),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              viewModel.addAdmin();
            }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Padding(
            padding: EdgeInsets.only(top: defSpacing / 2),
            child: ListView.builder(
                itemBuilder: (context, index) =>
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: defSpacing, vertical: defSpacing / 2),
                        child: GestureDetector(
                            onTap: () {},
                            child: Container(
                                height: MediaQuery
                                    .of(context)
                                    .size
                                    .height * .1,
                                decoration: BoxDecoration(
                                    color: Theme
                                        .of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(defSpacing),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 2,
                                          offset: Offset(0, 3) // changes position of shadow
                                      )
                                    ]),
                                padding: EdgeInsets.symmetric(vertical: defSpacing / 2, horizontal: defSpacing),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(children: [
                                        CircleAvatar(
                                            backgroundColor: kLightGray,
                                            backgroundImage:
                                            AssetImage('assets/images/admins/${viewModel.admins[index].image}'),
                                            radius: 30),
                                        SizedBox(width: defSpacing / 2),
                                        Text('${viewModel.admins[index].name}',
                                            style: TextStyle(color: Colors.black54, fontSize: 20))
                                      ]),
                                      viewModel.admins[index].isAdmin
                                          ? Icon(
                                        Icons.admin_panel_settings,
                                        color: kDark,
                                      )
                                          : Icon(Icons.build, color: kDark)
                                    ])))),
                itemCount: viewModel.admins.length)));
  }
}

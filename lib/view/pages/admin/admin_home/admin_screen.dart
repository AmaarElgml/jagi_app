import 'package:jagi_app/view/pages/splash/splash_screen.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:jagi_app/view/widgets/custom_pop_menu_item.dart';
import 'package:flutter/material.dart';
import 'admin_home_viewmodel.dart';

class AdminScreen extends StatelessWidget {
  static String id = 'AdminScreen.id';
  final AdminHomeViewModel viewModel = AdminHomeViewModel();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: <Widget>[
      // Background
      Column(children: <Widget>[
        Expanded(child: Container(color: primaryColor), flex: 3),
        Expanded(child: Container(color: Colors.transparent), flex: 5)
      ]),
      Container(
          child: Column(children: <Widget>[
        ListTile(
            contentPadding: EdgeInsets.only(left: defSpacing, right: defSpacing, top: height * .06),
            title: Text('Admin Panel', style: TextStyle(letterSpacing: 2, color: Colors.white, fontSize: 25)),
            trailing: GestureDetector(
                child: Padding(
                    padding: EdgeInsets.all(defSpacing / 2),
                    child: Icon(Icons.settings, color: Colors.white, size: 28)),
                onTapUp: (details) {
                  _showMenu(details, context);
                })),
        SizedBox(height: height * .1),
        Expanded(
            child: Container(
                padding: EdgeInsets.only(left: defSpacing, right: defSpacing, bottom: defSpacing),
                child: GridView.count(
                    crossAxisSpacing: defSpacing,
                    mainAxisSpacing: defSpacing,
                    crossAxisCount: 2,
                    childAspectRatio: .8,
                    children: List.generate(viewModel.icons.length, (index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, viewModel.routes[index]);
                          },
                          child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(defSpacing / 2)),
                              child: Center(
                                  child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                                Icon(viewModel.icons[index], color: primaryColor, size: 30),
                                SizedBox(height: defSpacing / 2),
                                Text(viewModel.options[index], style: TextStyle(color: primaryColor, fontSize: 15))
                              ]))));
                    }))))
      ]))
    ]));
  }

  _showMenu(details, context) {
    double dx = details.globalPosition.dx;
    double dy = details.globalPosition.dy;
    double dx2 = MediaQuery.of(context).size.width - dx;
    double dy2 = MediaQuery.of(context).size.width - dy;
    showMenu(context: context, position: RelativeRect.fromLTRB(dx, dy, dx2, dy2), items: [
      CustomPopMenuItem(
          child: Text('Log out'),
          onPressed: () {
            viewModel.logout();
            Navigator.of(context).pushNamedAndRemoveUntil(SplashScreen.id, (Route<dynamic> route) => false);
          })
    ]);
  }
}

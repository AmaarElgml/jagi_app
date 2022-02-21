import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main_screen_viewmodel.dart';

class MainScreen extends StatefulWidget {
  static String id = 'MainScreen.id';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainScreenViewModel viewModel = MainScreenViewModel();

  @override
  void dispose() {
    viewModel.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(elevation: 0, title: Text(viewModel.titles[viewModel.currentIndex], style: kLogoStyle), actions: [
          IconButton(
              icon: Icon((viewModel.currentIndex == 4) ? Icons.logout : CupertinoIcons.cart_fill),
              onPressed: () {
                (viewModel.currentIndex == 4)
                    ? viewModel.logout()
                    : setState(() {
                        viewModel.jumpTo(2);
                      });
              })
        ]),
        bottomNavigationBar: BottomNavyBar(
            selectedIndex: viewModel.currentIndex,
            onItemSelected: (index) => setState(() {
                  viewModel.jumpTo(index);
                }),
            items: [
              ...viewModel.titles.map((title) {
                return BottomNavyBarItem(
                  icon: Icon(viewModel.bottomBarIcons[viewModel.titles.indexOf(title)]),
                  title: Text(title),
                  activeColor: primaryColor,
                  inactiveColor: CupertinoColors.systemGrey,
                  textAlign: TextAlign.center,
                );
              })
            ]),
        body: SizedBox.expand(
            child: PageView(
                controller: viewModel.pageController,
                onPageChanged: (index) {
                  setState(() => viewModel.currentIndex = index);
                },
                children: <Widget>[...viewModel.screens])));
  }
}

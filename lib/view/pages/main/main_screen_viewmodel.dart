import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jagi_app/model/local/cache_helper.dart';
import 'package:jagi_app/model/services/auth.dart';
import 'package:jagi_app/view/pages/cart/cart_screen.dart';
import 'package:jagi_app/view/pages/home/home_screen.dart';
import 'package:jagi_app/view/pages/orders/orders_user_screen.dart';
import 'package:jagi_app/view/pages/settings/profile_screen.dart';

class MainScreenViewModel {
  final Auth _auth = Auth();
  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<IconData> bottomBarIcons = [
    CupertinoIcons.home,
    Icons.local_offer_outlined,
    CupertinoIcons.cart,
    CupertinoIcons.rectangle_grid_1x2,
    CupertinoIcons.person
  ];

  final List<String> titles = ['JAGI', 'Offers', 'Cart', 'Orders', 'Profile'];
  final List<IconData> icons = [
    CupertinoIcons.cart_fill,
    CupertinoIcons.cart_fill,
    CupertinoIcons.cart_fill,
    CupertinoIcons.cart_fill,
    Icons.logout
  ];

  final List<Widget> screens = [
    HomeScreen(),
    OrdersUserScreen(),
    CartScreen(),
    OrdersUserScreen(),
    ProfileScreen(),
  ];

  void jumpTo(int index) {
    currentIndex = index;
    pageController.jumpToPage(index);
  }

  void logout() {
    CacheHelper.clear().then((_) => _auth.signOut());
  }
}

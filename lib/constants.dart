import 'package:flutter/material.dart';
import 'package:jagi_app/view/pages/login/login_screen.dart';
import 'package:jagi_app/view/pages/register/signup_screen.dart';
import 'package:jagi_app/view/pages/admin/admin_home/admin_screen.dart';
import 'package:jagi_app/view/pages/admin/add_product/add_product_screen.dart';
import 'package:jagi_app/view/pages/admin/manage_products/manage_products_screen.dart';
import 'package:jagi_app/view/pages/admin/edit_product/edit_products_screen.dart';
import 'package:jagi_app/view/pages/admin/orders/orders_admin_screen.dart';
import 'package:jagi_app/view/pages/admin/roles/admin_roles_screen.dart';
import 'package:jagi_app/view/pages/admin/order_details/order_admin_details.dart';
import 'package:jagi_app/view/pages/splash/splash_screen.dart';
import 'package:jagi_app/view/pages/settings/profile_screen.dart';
import 'package:jagi_app/view/pages/main/main_screen.dart';
import 'package:jagi_app/view/pages/home/home_screen.dart';
import 'package:jagi_app/view/pages/product_info/product_info_screen.dart';
import 'package:jagi_app/view/pages/cart/cart_screen.dart';
import 'package:jagi_app/view/pages/checkout/checkout_screen.dart';
import 'package:jagi_app/view/pages/orders/orders_user_screen.dart';
import 'package:flutter/cupertino.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  LoginScreen.id: (context) => LoginScreen(),
  SignupScreen.id: (context) => SignupScreen(),
  SplashScreen.id: (context) => SplashScreen(),

/* User Screens*/
  MainScreen.id: (context) => MainScreen(),
  HomeScreen.id: (context) => HomeScreen(),
  ProductInfoScreen.id: (context) => ProductInfoScreen(),
  CartScreen.id: (context) => CartScreen(),
  CheckoutScreen.id: (context) => CheckoutScreen(),
  OrdersUserScreen.id: (context) => OrdersUserScreen(),
  ProfileScreen.id: (context) => ProfileScreen(),

/* Admins Screens*/
  AdminScreen.id: (context) => AdminScreen(),
  ManageProductsScreen.id: (context) => ManageProductsScreen(),
  AddProductScreen.id: (context) => AddProductScreen(),
  EditProductScreen.id: (context) => EditProductScreen(),
  OrdersAdminScreen.id: (context) => OrdersAdminScreen(),
  OrderAdminDetails.id: (context) => OrderAdminDetails(),
  AdminRolesScreen.id: (context) => AdminRolesScreen(),
};

void navigateTo(context, route) {
  Navigator.pushNamed(context, route);
}

void navigateReplaceTo(context, route) {
  Navigator.pushNamedAndRemoveUntil(context, route, (Route<dynamic> route) => false);
}

void showSnackBar(context, text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text.toString())));
}

// Firebase Constants //
final String kUsersCollection = 'Users';
final String kUserID = 'User ID';
final String kUserName = 'User Name';
final String kUserEmail = 'User Emil';
final String kUserPassword = 'User Password';

final String kProductCollection = 'Products';
final String kProductID = 'Product ID';
final String kProductName = 'Product Name';
final String kProductPrice = 'Product Price';
final String kProductDescription = 'Product Description';
final String kProductCategory = 'Product Category';
final String kProductImage = 'Product Image';
final String kProductQuantity = 'Product Quantity';

final String kOrders = 'Orders';
final String kOrderDetails = 'OrderDetails';
final String kOrderID = 'Order ID';
final String kTotalPrice = 'Total Price';

final String kAddress = 'Address';
final String kAddressText = 'Address Details';
final String kCity = 'City';
final String kState = 'State';
final String kZipCode = 'Zip Code';

final String kPaymentCard = 'Payment Card';
final String kCardNumber = 'Card Number';
final String kExpiration = 'Expiration';
final String kSecurityCode = 'Security Code';

final String kCoats = 'Coats';
final String kDresses = 'Dresses';
final String kTshirts = 'T-shirts';
final String kShoes = 'Shoes';

final String kIsLoggedSP = 'isLoggedIn';

final String clothDesc =
    "Crafted in Italy by expert artisans, this classic style is an instant wardrobe staple. Merino wool is a natural performance fiber, with thermoregulating properties that keep you warm when it's cool, and cool when it's warm. Articulated cuffs and hem ensure a perfect fit for this sweater, whether worn on its own or as an added layer of warmth.";

final adminEmail = 'admin@gmail.com';
final adminPassword = 'admin1234';

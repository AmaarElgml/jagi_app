import 'package:flutter/material.dart';
import 'package:jagi_app/model/local/cache_helper.dart';
import 'package:jagi_app/model/services/auth.dart';
import '../add_product/add_product_screen.dart';
import '../orders/orders_admin_screen.dart';
import '../roles/admin_roles_screen.dart';
import '../manage_products/manage_products_screen.dart';

class AdminHomeViewModel {
  final Auth _auth = Auth();

  final List<String> options = ['Add Products', 'Manage Products', 'View Orders', 'Admins Roles'];
  final List<IconData> icons = [Icons.add, Icons.edit, Icons.view_agenda_rounded, Icons.build];
  final List<String> routes = [AddProductScreen.id, ManageProductsScreen.id, OrdersAdminScreen.id, AdminRolesScreen.id];

  void logout() {
    CacheHelper.clear().then((_) => _auth.signOut());
  }
}

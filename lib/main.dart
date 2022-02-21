import 'package:flutter/material.dart';
import 'package:jagi_app/view/pages/splash/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jagi_app/provider/admin_mode.dart';
import 'package:jagi_app/provider/model_hud.dart';
import 'package:jagi_app/provider/cart_item.dart';
import 'package:jagi_app/styles/app_theme.dart';
import 'package:jagi_app/constants.dart';
import 'model/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ModelHUD>(create: (context) => ModelHUD()),
          ChangeNotifierProvider<CartItem>(create: (context) => CartItem()),
          ChangeNotifierProvider<AdminMode>(create: (context) => AdminMode())
        ],
        child: MaterialApp(
            theme: appTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.id,
            routes: appRoutes));
  }
}

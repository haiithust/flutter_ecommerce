import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/FavoriteProduct.dart';
import 'package:shop_app/models/OrderCart.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/main/main_screen.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/shared_preference_key.dart';
import 'package:shop_app/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(favoriteTable);
  await Hive.openBox(cartTable);
  final prefs = await SharedPreferences.getInstance();
  bool isViewGuideline = prefs.getBool(isViewGuidelineKey) ?? false;
  final String initRoute;
  if (isViewGuideline) {
    final String? email = prefs.getString(emailKey);
    if (email == null || email.isEmpty) {
      initRoute = SignInScreen.routeName;
    } else {
      initRoute = MainScreen.routeName;
    }
  } else {
    initRoute = SplashScreen.routeName;
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<OrderCart>(create: (context) => OrderCart()),
      ChangeNotifierProvider<FavoriteProduct>(create: (context) => FavoriteProduct()),
    ],
    child: MyApp(initialRoute: initRoute),
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({Key? key, required this.initialRoute}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme(),
      // home: SplashScreen(),
      // We use routeName so that we dont need to remember the name
      initialRoute: initialRoute,
      routes: routes,
    );
  }
}

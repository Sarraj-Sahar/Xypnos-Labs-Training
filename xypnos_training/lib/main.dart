import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xypnos_training/Screens/mainScreen.dart';
import 'package:xypnos_training/routes.dart';
import 'package:xypnos_training/screens_of_authentification/sign_in/sign_in_screen.dart';
import 'package:xypnos_training/provider/theme_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:shared/env.dart';
import 'package:xypnos_training/Splash_Screen/constellations_demo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);

  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  static String _pkg = "constellations_list";
  static String get pkg => Env.getPackage(_pkg);
  static String get bundle => Env.getBundle(_pkg);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GetMaterialApp(
      // themeMode: ThemeMode.light,
      themeMode: themeProvider.themeMode,
      // themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      title: 'Xypnos Training',
      // initialRoute: MainScreen.routeName,

      // initialRoute: SignInScreen.routeName,
      initialRoute: ConstellationsListDemo.routeName,
      routes: routes,
    );
  }
}

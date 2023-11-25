import 'package:flutter/material.dart';
import 'package:plutocart/src/pages/home/home.dart';
import 'package:plutocart/src/router/router.dart';


final navigatorState = GlobalKey<NavigatorState>();
class plutocartApp
 extends StatelessWidget {
  const plutocartApp
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Plutocart",
      home: HomePage(),
      routes: AppRoute.all,
    );
  }
}
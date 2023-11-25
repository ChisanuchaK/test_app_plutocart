import 'package:flutter/material.dart';
import 'package:plutocart/src/pages/home/home.dart';

class AppRoute{
  static const home = 'home';
  static const login = 'login';

 static get all => <String , WidgetBuilder>{
  home:(context) => const HomePage(),
 };
}
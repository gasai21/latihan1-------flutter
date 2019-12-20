import 'package:flutter/material.dart';
import 'screens/login_view.dart';
import 'screens/register_view.dart';
import 'screens/home_view.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "latihan 1",
    initialRoute: "/",
    routes: {
      "/" : (context) => LoginPageMain(),
      RegisterPage.routeName : (context) => RegisterPageMain(),
      "/home": (context) => HomePageMain()
    },
  ));
}
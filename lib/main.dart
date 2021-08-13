// @dart=2.9
import 'package:fan_page/screens/home_screen.dart';
import 'package:fan_page/screens/login_screen.dart';
import 'package:fan_page/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'screens/admin_message.dart';
import 'screens/add_message.dart';
import 'screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:splashscreen/splashscreen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FanPage',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/home' : (context) => Home(),
        '/login' : (context) => LogIn(),
        '/register' : (context) => Register(),
        '/admin' : (context) => AdminMessage(title: "Admin"),
        '/add' : (context) => AddMessage(title: "Add Message"),
        '/splash': (context) => Splash(),
      },
    );
  }
}


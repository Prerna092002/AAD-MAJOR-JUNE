import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'home_screen.dart';
class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SplashScreen(
          seconds: 4,
          navigateAfterSeconds: Home(),
          image: Image.asset('assets/images/splash.png',fit: BoxFit.cover,),
        photoSize: 150,
      ),
    );
  }
}

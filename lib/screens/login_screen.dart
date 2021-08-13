import 'package:fan_page/screens/admin_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  String userName = "";
  String password = "";
  bool _success = false;

  final _auth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
  // FacebookLogin _facebookLogin = FacebookLogin();
  Future<void> _handleGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if(googleUser == null) return;
      final googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential) ;
    } catch (error) {
      print(error);
    }
  }
  void _signInWithEmailAndPassword() async {
    final User? user = (await _auth.signInWithEmailAndPassword(
      email: userName,
      password: password,
    )).user;

    if (user != null) {
      Navigator.pushNamed(context, '/admin');
    }
  }

  Future<void> _handleFacebook() async {
    try {
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Center(child: Text("Login",style: TextStyle(fontSize: size.width*0.1,color: Color(0xff757575)),))),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Container(
              height: size.height*0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromRGBO(229, 229, 229, 0.6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextField(
                        onChanged: (value){ userName = value;},
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Email",
                          hintStyle: TextStyle(
                          color: Color(0xff757575),
                          fontSize: size.width*0.042,),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromRGBO(229, 229, 229, 0.6),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: TextField(
                        onChanged: (value){ password = value;},
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20),
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Color(0xff757575),
                            fontSize: size.width*0.042,),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _signInWithEmailAndPassword();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width*0.042,),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Text("Forgot Password?",style: TextStyle(
                  //   color: Color(0xff757575),
                  //   fontSize: size.width*0.032,),),
                  GestureDetector(
                    onTap: (){Navigator.pushNamed(context, '/register');},
                    child: Text("Don't have an account? Register",style: TextStyle(
                      color: Color(0xff757575),
                      fontSize: size.width*0.032,),),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onTap: () {
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xff3665AC),
                              ),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.all(9),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'f',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: size.width*0.03,
                                            fontFamily: 'sans-Bold'),
                                      ),
                                      Text(
                                        'Sign In with Facebook',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width*0.02,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: GestureDetector(
                            onTap: () async{
                              await _handleGoogle();
                              Navigator.pushNamed(context, '/admin');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xffEA4242),
                              ),
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.all(9),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'G',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width*0.03,
                                        fontFamily: 'sans-Bold'),
                                      ),
                                      Text(
                                        'Sign In with Google',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width*0.02,),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

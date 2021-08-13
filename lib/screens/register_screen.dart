import 'package:fan_page/screens/admin_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String fullName="";
  String eMail="";
  String password="";
  String userName="";
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String currentEmail = "farfallahudie@gmail.com";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  // void getData() async{
  //   await for (var snapshot in  _firestore.collection("admin").snapshots()){
  //         setState(() async{
  //           for(var snap in snapshot.docs)
  //             {
  //               currentEmail = snap.data()["email"];
  //             }
  //         });
  //  }
  // }
  
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
      await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
        Navigator.pushNamed(context, '/admin');
      }) ;
    } catch (error) {
      print(error);
    }
  }
  Future<void> _handleFacebook() async {
    try {
    } catch (error) {
      print(error);
    }
  }

  bool passwordSubmitted =false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GoogleSignIn _googleSignIn = GoogleSignIn();
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            width: size.width,
            height: size.height*0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Align(alignment:Alignment.bottomCenter,child: Padding(
                  padding:  EdgeInsets.only(bottom: size.height*0.05),
                  child: Text("Register",style: TextStyle(fontSize: size.width*0.1,color: Color(0xff757575)),),
                ))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    height: size.height*0.7,
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
                              onChanged: (value){
                                userName = value;
                              },
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Username",
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
                              onChanged: (value){
                                fullName = value;
                              },
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Full Name",
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
                              onChanged: (value){
                                eMail = value;
                              },
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Email Address",
                                hintStyle: TextStyle(
                                  color: Color(0xff757575),
                                  fontSize: size.width*0.042,),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromRGBO(229, 229, 229, 0.6),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: TextFormField(
                                  onChanged: (value){
                                    password = value;
                                  },
                                  onFieldSubmitted: (value){
                                    passwordSubmitted=true;
                                    setState(() {

                                    });
                                  },
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(password.length<6 && password!="" ? "Password should atleast contain 6 characters" :"",style: TextStyle(
                                fontSize: 10,
                                color: Colors.red
                              ),),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () async{
                            print(currentEmail);
                            try{
                              final newUser = await _auth.createUserWithEmailAndPassword(email: eMail, password: password).then((value) {
                                Navigator.pushNamed(
                                    context,
                                    '/admin'
                                );
                              });
                              // _firestore.collection("users").add({'userName' : userName,'password':password,'fullName' : fullName,'email':eMail});


                            }
                            catch(e)
                            {
                              print(e);
                            }

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
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width*0.042,),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){Navigator.pushNamed(context, '/login');},
                          child: Text("Registered Already? Login",style: TextStyle(
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
                                    await _handleGoogle().then((value){

                                    });

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
          ),
        ],
      ),
    );
  }
}

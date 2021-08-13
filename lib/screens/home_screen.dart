import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg.jpg'),
          fit: BoxFit.fitHeight,
          ),
        ),
        child: Container(
          height: size.height,
          width: size.width,
          color: Colors.grey.withOpacity(0.5),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: size.height*0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Farfalla Hu",style: TextStyle(color: Colors.white, fontSize: size.width*0.07),),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text("Admin of Fan Page",style: TextStyle(color: Colors.white, fontSize: size.width*0.05),),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Container(
                    width: size.width*0.7,
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/register');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      'Register',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.width*0.032,),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.white,width: 1),
                                ),
                                child: Center(
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: size.width*0.032,),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


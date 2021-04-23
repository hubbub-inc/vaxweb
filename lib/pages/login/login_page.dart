import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';

import 'package:vaxbud/widgets/CustomGestureDetector.dart';
import 'package:vaxbud/widgets/menu_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool showBottomMenu = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  bool _emailError = false, _passError = false, _loading = false;
  bool isDealer = true;



  @override
  Widget build(BuildContext context) {
    ThemeData _currentTheme = Theme.of(context);

    double height= MediaQuery.of(context).size.height;

    double threshold = 100;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomGestureDetector(
          axis: CustomGestureDetector.AXIS_Y,
          velocity: threshold,
          onSwipeUp: (){
            this.setState((){
              showBottomMenu = true;
            });
          },
          onSwipeDown: (){
            this.setState((){
              showBottomMenu = false;
            });
          },
          child: Container(
            height: height,
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.90,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "RPS",
                            style: TextStyle(
                                fontSize: 70,
                                fontWeight: FontWeight.w900,
                                color: Colors.black),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            maxLines: 1,
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: _currentTheme.accentColor,
                            decoration: InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(
                                Icons.person_outline,
                                color: _currentTheme.primaryColor,
                              ),
                              errorText: (_emailError) ? "Invalid Email" : null,
                              border: UnderlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            maxLines: 1,
                            controller: _passController,
                            obscureText: true,
                            cursorColor: _currentTheme.accentColor,
                            decoration: InputDecoration(
                              hintText: "Password",
                              errorText: (_passError) ? "Invalid Password" : null,
                              prefixIcon: Icon(
                                Icons.lock_outline,
                                color: _currentTheme.primaryColor,
                              ),
                              border: UnderlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                              filled: false,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            maxLines: 1,
                            controller: _passController,
                            obscureText: true,
                            cursorColor: _currentTheme.accentColor,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              errorText: (_passError) ? "Invalid Password" : null,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: _currentTheme.primaryColor,
                              ),
                              border: UnderlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                              filled: false,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextField(
                            maxLines: 1,
                            controller: _passController,
                            obscureText: true,
                            cursorColor: _currentTheme.accentColor,
                            decoration: InputDecoration(
                              hintText: "Full Name",
                              errorText: (_passError) ? "Invalid Password" : null,
                              prefixIcon: Icon(
                                Icons.person_pin,
                                color: _currentTheme.primaryColor,
                              ),
                              border: UnderlineInputBorder(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                              filled: false,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          AbsorbPointer(
                            absorbing: _loading,
                            child: SizedBox(
                              width: double.infinity,
                              child: MaterialButton(
                                color: _currentTheme.primaryColor,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text(
                                        "LOGIN",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                                onPressed: () {
                                  String email = _emailController.text.trim();
                                  String pass = _passController.text.trim();
                                  this.setState(() {
                                    _emailError = email == "";
                                    _passError = pass == "";
                                  });
                                  if (!(_emailError || _passError)) {}
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "Skip Login >",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                AnimatedOpacity(
                  duration: Duration(milliseconds: 200),
                  opacity: (showBottomMenu)?1.0:0.0,
                  child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 5.0,sigmaY: 5.0),

                    child: Container(
                      color: Colors.black.withOpacity(0.2),
                    ),),
                ),

                AnimatedPositioned(
                    curve: Curves.easeInOut,
                    duration: Duration(milliseconds: 200),
                    left: 0,
                    bottom: (showBottomMenu)?-60:-(height/3),
                    child: MenuWidget())

              ],
            ),
          ),
        ),
      ),
    );
  }
}

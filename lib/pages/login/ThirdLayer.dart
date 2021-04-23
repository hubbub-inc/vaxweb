import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ThirdLayer extends StatefulWidget {
  @override
  _ThirdLayerState createState() => _ThirdLayerState();
}


class _ThirdLayerState extends State<ThirdLayer> {



TextEditingController _emailController = TextEditingController();
TextEditingController _passController = TextEditingController();
bool _emailError = false, _passError = false, _loading = false;
bool isDealer = true;



@override

  Widget build(BuildContext context) {
ThemeData _currentTheme = Theme.of(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Row(
                        children: [
                          Text(
                            "Vax",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Bud",
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.blue[200],
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
        Row(children: <Widget>[        MaterialButton(
                  color: _currentTheme.primaryColor,
                  child:
                        Text(
                          "LOGIN",
                          style: TextStyle(color: Colors.white),
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
          SizedBox(width: 15),
          MaterialButton(
            color: _currentTheme.primaryColor,
            child:
            Text(
              "SKIP",
              style: TextStyle(color: Colors.white),
            ),




            onPressed: () {
              Navigator.pushNamed(context, '/home');

            },
          ),
]),
              ],
            ),
          ],
        ),
    )
    );
  }
}

import 'SecondLayer.dart';
import 'package:flutter/material.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:url_launcher/url_launcher.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Future<void> _launched;
  static const String toLaunch = 'https://www.cylog.org/headers/';
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;

  bool isOpen = false;
  bool isPlaying = false;

  Widget buttonLink(String title) => Container(
      height: 30.0,
      width: 100.0,
      margin: EdgeInsets.all(10),
      child: RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints:
            BoxConstraints(maxWidth: 250.0, minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
        ),
      ));

  Future<void> _launchInWebViewWithJavaScript(String url) async {
    if (await canLaunch(url)) {
      await  launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }


  Future<void> _launchInWebViewOrVC(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        transform: Matrix4Transform()
            .translate(x: xoffSet, y: yoffSet)
            .rotate(angle)
            .matrix4,
        duration: Duration(milliseconds: 250),
        child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: isOpen
                    ? BorderRadius.circular(10)
                    : BorderRadius.circular(0)),
            child: SafeArea(
              child: Stack(
                children: [
                  Column(children: <Widget>[
                  SizedBox(height: 50.0),
                  Row(children: <Widget>[
                    SizedBox(width: 50),
                  !isOpen
                      ? GestureDetector(
                         child: Text('TAP TO GET STARTED'),
                          onTap: () {
                            setState(() {
                              xoffSet = 150;
                              yoffSet = 80;
                              angle = -0.2;
                              isOpen = true;
                            });

                            secondLayerState.setState(() {
                              secondLayerState.xoffSet = 122;
                              secondLayerState.yoffSet = 110;
                              secondLayerState.angle = -0.275;
                            });
                          })
                      : IconButton(
                          icon: Icon(Icons.arrow_back_ios,
                              color: Color(0xFF1f186f)),
                          onPressed: () {
                            if (isOpen == true) {
                              setState(() {
                                xoffSet = 0;
                                yoffSet = 0;
                                angle = 0;
                                isOpen = false;
                              });

                              secondLayerState.setState(() {
                                secondLayerState.xoffSet = 0;
                                secondLayerState.yoffSet = 0;
                                secondLayerState.angle = 0;
                              });
                            }
                          })]),]),
                  Center(
                    child: Image.asset(
                      "assets/avatar.png",
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                  ),
                  Column(
                    children: <Widget>[

                    SizedBox(height: 300.0),

                  const Padding(padding: EdgeInsets.all(16.0)),
                  buttonLink("Save time"),
                      buttonLink("Stay Safe"),

                      buttonLink("Have fun"),
                  ]),
                ],
              ),
            )));
  }
}

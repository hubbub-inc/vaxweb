import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:vaxbud/widgets/menu_widget.dart';


class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();

}

class _MapPageState extends State<MapPage> {
          String apiKey = "pk.eyJ1IjoibWNhcnJlbGxhIiwiYSI6ImNraTduYWN0czBtOGwyem85aTJlODRzcHIifQ.SLTfO5mti0vg2WHJij_6_A";
          void _onMapCreated(MapboxMapController controller) {
                mapController = controller;
            }
          MapboxMapController mapController;
          @override
          Widget build(BuildContext context) {
            return Scaffold(
                body:   Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),


            ),

            height: MediaQuery.of(context).size.height/2,

            width: MediaQuery.of(context).size.width,

            child: Column(
            children: <Widget>[
              MenuWidget(),
            ],
            ),
            ),

            );
          }
          }

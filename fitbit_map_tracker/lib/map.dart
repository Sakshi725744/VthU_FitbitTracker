import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController _controller;
  List<Marker> m = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD02850),
        title: Center(child: Text("Map Tracker",style: TextStyle(color: Colors.white),)),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        trafficEnabled: true,
        initialCameraPosition:
        CameraPosition(target: LatLng(17.3850,78.4867), zoom: 10.0),
        markers: Set.from(m),
        onTap:_ontapMarker,
        onMapCreated: (GoogleMapController controller){
          _controller=controller;
        },
      ),
    );
  }
  _ontapMarker(value) async{
    var response= await FirebaseFirestore.instance.collection("fitbit").doc("location").get();
    GeoPoint point=response["current"];
       setState(() {
      m=[];
      m.add(Marker(position: LatLng(point.latitude,point.longitude),infoWindow:InfoWindow(title: "Danger!"),markerId: MarkerId("Danger"),icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed)));
    });
  }
}

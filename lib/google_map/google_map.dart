
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:weather/network/data_service.dart';
import 'package:weather/network/model.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  List<Marker> markers =[];
  CurrentWeatherModel _currentWeatherModel;

  whenTaped(LatLng point) async{
    setState(() {
      markers = [];
      markers.add(Marker(markerId: MarkerId(point.toString()),
      position: point,
      ));
      print(point.toString());
      print(point.latitude);
      print(point.longitude);
    });
    DataService dataService = new DataService();
    _currentWeatherModel = await dataService.getCurrentLocation(point.latitude.toString(), point.longitude.toString());
    showModalBottomSheet(context: context,
       isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height*0.35,
        decoration: BoxDecoration(borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               Container(
                 width: 250,
                 height: 50,
                 color: Colors.black,
                 child: Center(child:  Text(_currentWeatherModel.name ?? '' , style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold),),),
               ),
                SizedBox(height: 20,),
                Container(
                  width: 250,
                  height: 50,
                  color: Colors.black,
                  child: Center(child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text(_currentWeatherModel.main.temp.toString() ?? '' , style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold),),
                    SizedBox(width: 5,),
                    Text('c' , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
                  ],)),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 250,
                  height: 50,
                  color: Colors.black,
                  child: Center(child:  Text(_currentWeatherModel.weather[0].description ?? '' , style: TextStyle(color: Colors.white , fontSize: 30 , fontWeight: FontWeight.bold),),),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
  // GoogleMapController mapController;
  // var getCurrentLocation;
  // @override
  // void initState() {
  //   super.initState();
  //   Geolocator.getCurrentPosition().then((currloc) {
  //     getCurrentLocation = currloc;
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon: Icon(Icons.arrow_back_sharp , size: 25 , color: Colors.black,),
        onPressed: (){
          Navigator.pop(context);
        },
        ),
      ),
      body:
      // getCurrentLocation == null ? Container(
      //   alignment: Alignment.center,
      //   child: Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // ):
      Stack(
        children: [
          GoogleMap(
            markers: Set.from(markers),

            initialCameraPosition: CameraPosition(
              target: LatLng(31 , 31),
              zoom: 10,),
            myLocationEnabled:  true,
            mapType: MapType.normal,
            onTap: whenTaped,
          ),
        ],
      )
    );

  }

}

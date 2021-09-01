import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/google_map/google_map.dart';
import 'package:weather/home_screens/search_screen.dart';
import 'package:weather/network/data_service.dart';
import 'package:weather/network/model.dart';


class ViewScreen extends StatefulWidget {
  Position currentLocation;

  ViewScreen(this.currentLocation );
  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {

  bool isLoading = true;
 CurrentWeatherModel _weatherRespone;
  Position currentSearch;

  void getData() async {
    DataService dataService = DataService();
    _weatherRespone = await dataService.getCurrentLocation('${widget.currentLocation.latitude}' , '${widget.currentLocation.longitude}');
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Weather' , style: TextStyle(color: Colors.white , fontSize: 30),),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>SearchScreen()));
          }, icon: Icon(Icons.search , size: 30, color: Colors.white,)),

IconButton(onPressed: (){
  Navigator.push(context, MaterialPageRoute(builder: (context) =>GoogleMapScreen()));
}, icon: Icon(Icons.location_on_outlined , color: Colors.white , size: 30,))
        ],
      ),
      body: isLoading ? Center(child: CircularProgressIndicator(backgroundColor: Colors.black, color:Colors.black ,)) : Container(
        child: Stack(
          children: [
            Image.network('https://i.pinimg.com/originals/03/46/bf/0346bfd0986cffdfdc19b48c5f548ca6.jpg' ,
            fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            if (_weatherRespone !=null)
            Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 120,),
                Text(_weatherRespone.name ?? '' , style: TextStyle(color: Colors.white , fontSize: 50 , fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text(_weatherRespone.main.temp.toString(), style: TextStyle(color: Colors.white , fontSize: 50 , fontWeight: FontWeight.bold),),
                   Text('c' , style: TextStyle(color: Colors.white , fontSize: 20 , fontWeight: FontWeight.bold),),
                 ],
               ),
                SizedBox(height: 20,),

                Text(_weatherRespone.weather[0].description ?? '', style: TextStyle(color: Colors.white , fontSize: 35 , fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),

                Text(_weatherRespone.base ?? '', style: TextStyle(color: Colors.white , fontSize: 35 , fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),

                Text(_weatherRespone.clouds.toString() ?? '', style: TextStyle(color: Colors.white , fontSize: 35 , fontWeight: FontWeight.bold),),

              ],
            ),)
          ],
        ),
      ),
    );
  }
}

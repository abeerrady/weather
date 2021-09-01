import 'package:flutter/material.dart';
import 'package:weather/home_screens/controller.dart';
import 'package:weather/network/model.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController textEditingController = TextEditingController();
  CurrentWeatherModel _currentWeatherModel;
  bool _isLoading = false;
  WeatherSearch _weatherSearch = WeatherSearch();
  gettingData(city) async {
    setState(() {
      _isLoading = true;
    });
    _currentWeatherModel = await _weatherSearch.fetchWeatherDataBycity(city);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
        Image.network('https://i.pinimg.com/originals/03/46/bf/0346bfd0986cffdfdc19b48c5f548ca6.jpg' ,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
          Padding(
            padding: const EdgeInsets.only(top: 45.0, left: 5, right: 5),
            child: Container(
              height: 45,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        size: 35,
                        color: Colors.white,
                      )),
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: TextEditingController(),
                      onFieldSubmitted: (value) {
                        gettingData(value);
                      },
                      decoration: InputDecoration(
                          hintText: 'Search Here',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 18),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 40,
                            color: Colors.white,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(5),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                    children: _currentWeatherModel == null
                        ? [
                            Center(child: Text('No Result' , style: TextStyle(color: Colors.white , fontSize: 25),)),
                          ]
                        : [
                            Text(
                              _currentWeatherModel.name ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              _currentWeatherModel.main.temp.toString() ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              _currentWeatherModel.weather[0].description ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              _currentWeatherModel.sys.country.toString() ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              _currentWeatherModel.wind.toString() ?? '',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                  ),
              ),
        ],
      ),
    );
  }
}

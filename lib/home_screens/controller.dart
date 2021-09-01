


import 'package:dio/dio.dart';
import 'package:weather/network/model.dart';

class WeatherSearch{
  final _dio = Dio();
  Future<CurrentWeatherModel> fetchWeatherDataBycity (city) async{

    try{
      final resonse = await _dio.get('http://api.openweathermap.org/data/2.5/weather?q=$city&appid=9c15af06166e304ab03ac7075db2b74a');
      final resp = resonse.data;
      print(resp);
      return resonse.statusCode == 200 ? CurrentWeatherModel.fromJson(resp) : null ;
    } catch(e) {
      return null;
    }
  }
}

import 'package:dio/dio.dart';
import 'model.dart';

class DataService{
  final dio = Dio();
  Future<CurrentWeatherModel> getCurrentLocation (String lat , String long) async{
    print('getting data');
    final response = await dio.get('http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=9c15af06166e304ab03ac7075db2b74a');
    print(response.data);
    if(response.statusCode ==200) {
      return CurrentWeatherModel.fromJson(response.data);
    }
    else{
      throw Exception('error when load Weather data');
    }
    // return response.data;
    // print(response.data);
  }
}











//http://api.openweathermap.org/data/2.5/weather?q=cairo&appid=9c15af06166e304ab03ac7075db2b74a
//http://api.openweathermap.org/data/2.5/weather?lat=31&lon=31&appid=9c15af06166e304ab03ac7075db2b74a
//AIzaSyA2UZ9RFhFGz-gN6rWewT0U6en_22bn3Cs
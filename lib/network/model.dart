import 'dart:convert';
//
// class WeatherRespone {
//   String description;
//   String icon;
//   String main;
//
//   WeatherRespone({this.description, this.icon,this.main});
//
//   WeatherRespone.fromJson(Map<String, dynamic> json) {
//     this.description = json['description'];
//     this.icon = json['icon'];
//     this.main=json['main'];
//   }
// }
//
// class MainInfo {
//   double temperature;
//   double tempMin;
//   double tempMax;
//   int humidity;
//
//   MainInfo({this.temperature,this.tempMin,this.tempMax,this.humidity});
//
//   MainInfo.fromJson(Map<String, dynamic> json) {
//     this.temperature = json['temp'];
//     this.tempMin=json['temp_min'];
//     this.tempMax=json['temp_max'];
//     this.humidity=json['humidity'];
//
//   }
// }

// class WeatherResponse {
//   String cityName;
//   // MainInfo tempInfo;
//   // WeatherRespone weatherInfo;
//
//   String get iconUrl {
//     return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
//   }
//
//   WeatherResponse({this.cityName, this.tempInfo, this.weatherInfo});
//
//   WeatherResponse.fromJson(Map<String, dynamic> json) {
//     this.cityName = json['name'];
//
//     var tempInfoJson = json['main'];
//     this.tempInfo = MainInfo.fromJson(tempInfoJson);
//
//     var weatherInfoJson = json['weather'][0];
//     this.weatherInfo = WeatherRespone.fromJson(weatherInfoJson);
//
//   }
// }

// To parse this JSON data, do
//
//     final currentWeatherModel = currentWeatherModelFromJson(jsonString);

CurrentWeatherModel currentWeatherModelFromJson(String str) => CurrentWeatherModel.fromJson(json.decode(str));

String currentWeatherModelToJson(CurrentWeatherModel data) => json.encode(data.toJson());

class CurrentWeatherModel {
  CurrentWeatherModel({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  Coord coord;
  List<Weather> weather;
  String base;
  Main main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) => CurrentWeatherModel(
    coord: Coord.fromJson(json["coord"]),
    weather: List<Weather>.from(json["weather"].map((x) => Weather.fromJson(x))),
    base: json["base"],
    main: Main.fromJson(json["main"]),
    visibility: json["visibility"],
    wind: Wind.fromJson(json["wind"]),
    clouds: Clouds.fromJson(json["clouds"]),
    dt: json["dt"],
    sys: Sys.fromJson(json["sys"]),
    timezone: json["timezone"],
    id: json["id"],
    name: json["name"],
    cod: json["cod"],
  );

  Map<String, dynamic> toJson() => {
    "coord": coord.toJson(),
    "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
    "base": base,
    "main": main.toJson(),
    "visibility": visibility,
    "wind": wind.toJson(),
    "clouds": clouds.toJson(),
    "dt": dt,
    "sys": sys.toJson(),
    "timezone": timezone,
    "id": id,
    "name": name,
    "cod": cod,
  };
}

class Clouds {
  Clouds({
    this.all,
  });

  int all;

  factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
    all: json["all"],
  );

  Map<String, dynamic> toJson() => {
    "all": all,
  };
}

class Coord {
  Coord({
    this.lon,
    this.lat,
  });

  double lon;
  double lat;

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
    lon: json["lon"].toDouble(),
    lat: json["lat"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "lon": lon,
    "lat": lat,
  };
}

class Main {
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  factory Main.fromJson(Map<String, dynamic> json) => Main(
    temp: json["temp"].toDouble(),
    feelsLike: json["feels_like"].toDouble(),
    tempMin: json["temp_min"].toDouble(),
    tempMax: json["temp_max"].toDouble(),
    pressure: json["pressure"],
    humidity: json["humidity"],
  );

  Map<String, dynamic> toJson() => {
    "temp": temp,
    "feels_like": feelsLike,
    "temp_min": tempMin,
    "temp_max": tempMax,
    "pressure": pressure,
    "humidity": humidity,
  };
}

class Sys {
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  int type;
  int id;
  String country;
  int sunrise;
  int sunset;

  factory Sys.fromJson(Map<String, dynamic> json) => Sys(
    type: json["type"],
    id: json["id"],
    country: json["country"],
    sunrise: json["sunrise"],
    sunset: json["sunset"],
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "id": id,
    "country": country,
    "sunrise": sunrise,
    "sunset": sunset,
  };
}

class Weather {
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  int id;
  String main;
  String description;
  String icon;

  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
    id: json["id"],
    main: json["main"],
    description: json["description"],
    icon: json["icon"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "main": main,
    "description": description,
    "icon": icon,
  };
}

class Wind {
  Wind({
    this.speed,
    this.deg,
  });

  double speed;
  int deg;

  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
    speed: json["speed"].toDouble(),
    deg: json["deg"],
  );

  Map<String, dynamic> toJson() => {
    "speed": speed,
    "deg": deg,
  };
}

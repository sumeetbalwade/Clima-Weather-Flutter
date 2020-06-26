import 'dart:convert';

import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class Wheather {
  String url, city;
  double temp;
  int condition;

  Wheather({@required double latitude, @required double longitude}) {
    url =
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiopenwheather&units=metric';
  }
  Wheather.city({@required String cityname}) {
    url =
        'https://api.openweathermap.org/data/2.5/weather?q=$cityname&appid=$apiopenwheather&units=metric';
  }

  Future<void> getdata() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      String data = response.body;

      city = jsonDecode(data)["name"];
      num t = jsonDecode(data)["main"]["temp"];
      temp = t.toDouble();
      condition = jsonDecode(data)["weather"][0]["id"];
    } else {
      print(response.statusCode);
    }
  }
}

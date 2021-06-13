import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clima/services/location.dart';
import 'package:http/http.dart' as http;

const apiKey = '7555f9fc90c8c804298742c06723c8ce';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var myLocation = MyLocation();
  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    //print('getLocation Start');
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation();
    latitude = myLocation.latitude;
    longitude = myLocation.longitude;
    // print(myLocation.latitude);
    // print(myLocation.longitude);
    getData();
  }

  void getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      //var longitude = jsonDecode(data)['coord']['lon'];
      //weather[0].id
      var id = jsonDecode(data)['weather'][0]['id'];
      //main.temp
      var temp = jsonDecode(data)['main']['temp'];
      //name
      var city = jsonDecode(data)['name'];

      print('id $id, temp $temp, city $city');
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold();
  }
}

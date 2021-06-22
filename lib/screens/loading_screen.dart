import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_clima/screens/location_screen.dart';
import 'package:flutter_clima/services/location.dart';
import 'package:flutter_clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
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
    getLocationData();
  }

  void getLocationData() async {
    //print('getLocation Start');
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation();
    latitude = myLocation.latitude;
    longitude = myLocation.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen();
        },
      ),
    );

    /* var id = jsonDecode(weatherData)['weather'][0]['id'];
    //main.temp
    var temp = jsonDecode(weatherData)['main']['temp'];
    //name
    var city = jsonDecode(weatherData)['name'];

    print('id $id, temp $temp, city $city');*/
  }

  @override
  Widget build(BuildContext context) {
    //getData();
    return Scaffold(
      body: Container(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}

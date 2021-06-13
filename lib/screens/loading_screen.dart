import 'package:flutter/material.dart';
import 'package:flutter_clima/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var myLocation = MyLocation();
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    //print('getLocation Start');
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation();
    print(myLocation.latitude);
    print(myLocation.longitude);
  }

  void getData() async {
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=7555f9fc90c8c804298742c06723c8ce');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_clima/services/location.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

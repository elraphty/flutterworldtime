import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // Make the request
    Response response = await get('http://worldtimeapi.org/api/timezone/Africa/Lagos');
    Map data = jsonDecode(response.body);

    // Get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);

    print(datetime);
    print(offset);

    // Create a date time object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print(now);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Loading'))
    );
  }
}

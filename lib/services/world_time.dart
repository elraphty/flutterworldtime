import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to flag icon
  String url; // location url for api endpoints
  bool isDatetime; // true or false if its daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // Make the request
      Response response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // Create a date time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      // time = now.toString();
      print(now.hour);
      isDatetime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch(e) {
      print('Error:  $e');
      time = 'Could not get time data';
    }
  }

}
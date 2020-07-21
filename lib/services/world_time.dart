import 'package:http/http.dart';
import 'dart:convert';

class WorldTime {
  String location; // location name for the UI
  String time; // the time in that location
  String flag; // url to flag icon
  String url; // location url for api endpoints

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
      time = now.toString();
    } catch(e) {
      print('Error:  $e');
      time = 'Could not get time data';
    }
  }

}
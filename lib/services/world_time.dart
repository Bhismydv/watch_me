import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
class WorldTime {
  bool isDayTime; // true or false : day or night
  String? time; // the time in that location
  String location; //location name for the ui
  String flag; // url to an asset image icon
  String url; //location url for api endpoint

  WorldTime ( {required this.location,
    required this.flag,
    required this.url,
    required this.isDayTime});

 Future<void> getTime()async {

try {
  //make the request
  Response response = await get(
      Uri.parse('http://worldtimeapi.org/api/timezone/$url/'));
  Map data = jsonDecode(response.body);

  //get the properties from data
  String dateTime = data['datetime'];
  int offset = int.parse(data['utc_offset'].substring(0,3));

  print(dateTime);
  print(offset);

  //create datetime object
  DateTime now = DateTime.parse(dateTime);
  now = now.add(new Duration(hours: offset));
  print(now);
/*  DateTime now = DateTime.parse(data["datetime"]);
  int offset = int.parse(data["utc_offset"].substring(1, 3));
  String operator = data["utc_offset"].substring(0, 1);
  if (operator == "+") {
    now = now.add(new Duration(hours: offset));
  } else if (operator == "-") {
    now = now.subtract(new Duration(hours: offset));
 */

  //set the time property
  time = DateFormat.jm().format(now);
  print(time);

  isDayTime = now.hour > 6 && now.hour < 20 ? true : false;


} catch (e) {
     print(e);
     time = 'could not get time';
   }
 }
}


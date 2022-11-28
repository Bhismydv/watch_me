import 'package:flutter/material.dart';
import 'package:watch_me/pages/home.dart';
import 'package:watch_me/pages/loading.dart';
import 'package:watch_me/pages/pick_location.dart';
import 'package:watch_me/services/world_time.dart';

void main() {
  runApp(MaterialApp(

    initialRoute: '/',
    routes: {
      '/home': (context) => Home(),
      '/': (context) => Loading(),
      '/pick_location': (context) => Pick_Location()
    },
  ));
}

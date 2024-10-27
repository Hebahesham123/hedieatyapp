// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:hedieatyapp/HomePage.dart';
// ignore: unused_import
import 'friend_events_page.dart';
// ignore: unused_import
import 'event_gifts_page.dart';
import 'my_events_page.dart';
import 'my_gifts_page.dart';

void main() => runApp(HedieatyApp());

class HedieatyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hedieaty',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/myEvents': (context) => MyEventsPage(),
        '/myGifts': (context) => MyGiftsPage(),
      },
    );
  }
}

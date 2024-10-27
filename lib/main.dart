// ignore_for_file: use_key_in_widget_constructors, dead_code

import 'package:flutter/material.dart';
import 'package:hedieatyapp/HomePage.dart';
import 'my_events_page.dart';
import 'my_gifts_page.dart';
import 'login_page.dart';
import 'sign_up_page.dart';

void main() => runApp(HedieatyApp());

class HedieatyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate user authentication status; set to `true` to skip login
    bool isLoggedIn = false;

    return MaterialApp(
      title: 'Hedieaty',
      theme: ThemeData(primarySwatch: Colors.blue),
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? '/home' : '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        '/myEvents': (context) => MyEventsPage(),
        '/myGifts': (context) => MyGiftsPage(),
      },
    );
  }
}

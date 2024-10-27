// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyGiftsPage extends StatelessWidget {
  final List<String> myGifts = [
    'Watch',
    'Headphones',
    // Add more gifts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Gifts')),
      body: ListView.builder(
        itemCount: myGifts.length,
        itemBuilder: (context, index) {
          final gift = myGifts[index];
          return ListTile(
            title: Text(gift),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.edit), onPressed: () {}),
                IconButton(icon: Icon(Icons.delete), onPressed: () {}),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add gift functionality for the logged-in user
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

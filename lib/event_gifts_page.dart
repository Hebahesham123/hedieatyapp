// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class EventGiftsPage extends StatelessWidget {
  final String eventName;

  EventGiftsPage({required this.eventName});

  final List<String> gifts = [
    'Laptop',
    'Smartphone',
    // Add more gifts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$eventName Gifts",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: gifts.length,
          itemBuilder: (context, index) {
            final gift = gifts[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                leading: Icon(Icons.card_giftcard,
                    color: Colors.purple[700], size: 30),
                title: Text(
                  gift,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900],
                  ),
                ),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: Colors.purple[700]),
                onTap: () {
                  // Future functionality to view gift details
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add gift functionality for the logged-in user
        },
        backgroundColor: Color(0xFF8E24AA),
        tooltip: 'Add a Gift',
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

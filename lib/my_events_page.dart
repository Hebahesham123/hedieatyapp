// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class MyEventsPage extends StatelessWidget {
  final List<String> myEvents = [
    'My Birthday',
    'Graduation',
    // Add more events as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Events',
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
          itemCount: myEvents.length,
          itemBuilder: (context, index) {
            final event = myEvents[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                title: Text(
                  event,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple[900],
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      tooltip: 'Edit Event',
                      onPressed: () {
                        // Implement edit event functionality
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      tooltip: 'Delete Event',
                      onPressed: () {
                        // Implement delete event functionality
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add event functionality
        },
        backgroundColor: Color(0xFF8E24AA),
        tooltip: 'Add Event',
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

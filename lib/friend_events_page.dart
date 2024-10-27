import 'package:flutter/material.dart';
import 'event_gifts_page.dart';

class FriendEventsPage extends StatelessWidget {
  final String friendName;

  FriendEventsPage({required this.friendName});

  final List<String> events = [
    'Birthday Party',
    'Wedding Anniversary',
    // Add more events as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "$friendName's Events",
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
          itemCount: events.length,
          itemBuilder: (context, index) {
            final event = events[index];
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
                trailing:
                    Icon(Icons.arrow_forward_ios, color: Colors.purple[700]),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventGiftsPage(eventName: event),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

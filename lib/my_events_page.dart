// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class MyEventsPage extends StatefulWidget {
  @override
  _MyEventsPageState createState() => _MyEventsPageState();
}

class _MyEventsPageState extends State<MyEventsPage> {
  List<String> myEvents = [
    'My Birthday',
    'Graduation',
    // Add more events as needed
  ];

  // Function to show a dialog for adding or editing an event
  void _showEventDialog({String? initialEvent, int? index}) {
    final TextEditingController eventController = TextEditingController(
      text: initialEvent,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(initialEvent == null ? 'Add New Event' : 'Edit Event'),
        content: TextField(
          controller: eventController,
          decoration: InputDecoration(hintText: 'Event Name'),
        ),
        actions: [
          if (initialEvent != null) // Show delete button only for editing
            TextButton(
              onPressed: () {
                setState(() {
                  myEvents.removeAt(index!);
                });
                Navigator.pop(context);
              },
              child: Text('Delete', style: TextStyle(color: Colors.red)),
            ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final newEvent = eventController.text.trim();
              if (newEvent.isNotEmpty) {
                setState(() {
                  if (index == null) {
                    myEvents.add(newEvent); // Add new event
                  } else {
                    myEvents[index] = newEvent; // Update existing event
                  }
                });
              }
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      ),
    );
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            tooltip: 'Add Event',
            onPressed: () {
              _showEventDialog(); // Open dialog to add new event
            },
          ),
        ],
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
                        _showEventDialog(initialEvent: event, index: index);
                      },
                    ),
                  ],
                ),
                onTap: () {
                  _showEventDialog(
                      initialEvent: event, index: index); // Edit on tap
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyGiftsPage extends StatefulWidget {
  @override
  _MyGiftsPageState createState() => _MyGiftsPageState();
}

class _MyGiftsPageState extends State<MyGiftsPage> {
  List<String> myGifts = [
    'Watch',
    'Headphones',
    // Add more gifts as needed
  ];

  // Function to show a dialog for adding or editing a gift
  void _showGiftDialog({String? initialGift, int? index}) {
    final TextEditingController giftController = TextEditingController(
      text: initialGift,
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(initialGift == null ? 'Add New Gift' : 'Edit Gift'),
        content: TextField(
          controller: giftController,
          decoration: InputDecoration(hintText: 'Gift Name'),
        ),
        actions: [
          if (initialGift != null) // Show delete button only when editing
            TextButton(
              onPressed: () {
                setState(() {
                  myGifts.removeAt(index!);
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
              final newGift = giftController.text.trim();
              if (newGift.isNotEmpty) {
                setState(() {
                  if (index == null) {
                    myGifts.add(newGift); // Add new gift
                  } else {
                    myGifts[index] = newGift; // Update existing gift
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
          'My Gifts',
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
            tooltip: 'Add Gift',
            onPressed: () {
              _showGiftDialog(); // Open dialog to add new gift
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: myGifts.length,
          itemBuilder: (context, index) {
            final gift = myGifts[index];
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
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      tooltip: 'Edit Gift',
                      onPressed: () {
                        _showGiftDialog(initialGift: gift, index: index);
                      },
                    ),
                  ],
                ),
                onTap: () {
                  _showGiftDialog(
                      initialGift: gift, index: index); // Edit on tap
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class EventGiftsPage extends StatefulWidget {
  final String eventName;
  final List<String> gifts;

  EventGiftsPage({required this.eventName, required this.gifts});

  @override
  _EventGiftsPageState createState() => _EventGiftsPageState();
}

class _EventGiftsPageState extends State<EventGiftsPage> {
  late List<bool> isPledged;

  @override
  void initState() {
    super.initState();
    isPledged = List.filled(widget.gifts.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.eventName} Gifts",
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
          itemCount: widget.gifts.length,
          itemBuilder: (context, index) {
            final gift = widget.gifts[index];
            final pledged = isPledged[index];

            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                leading: Icon(
                  pledged ? Icons.check_circle : Icons.card_giftcard,
                  color: pledged ? Colors.green : Colors.purple[700],
                  size: 30,
                ),
                title: Text(
                  gift,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: pledged ? Colors.green : Colors.purple[900],
                    decoration: pledged
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: pledged
                    ? Text(
                        "Pledged",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Icon(Icons.arrow_forward_ios, color: Colors.purple[700]),
                onTap: () {
                  setState(() {
                    isPledged[index] = !isPledged[index];
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

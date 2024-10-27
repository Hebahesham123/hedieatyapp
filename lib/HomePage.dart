import 'package:flutter/material.dart';
import 'friend_events_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> friends = [
    {
      'name': 'Mohamed H',
      'image': 'https://example.com/path/to/mohamed_image.jpg',
      'upcomingEvents': 2,
    },
    {
      'name': 'Sara W',
      'image': 'https://example.com/path/to/sara_image.jpg',
      'upcomingEvents': 0,
    },
    {
      'name': 'Sara W',
      'image': 'https://example.com/path/to/sara_image.jpg',
      'upcomingEvents': 0,
    },
    {
      'name': 'Sara W',
      'image': 'https://example.com/path/to/sara_image.jpg',
      'upcomingEvents': 0,
    },
    {
      'name': 'Sara W',
      'image': 'https://example.com/path/to/sara_image.jpg',
      'upcomingEvents': 0,
    },
    {
      'name': 'Sara W',
      'image': 'https://example.com/path/to/sara_image.jpg',
      'upcomingEvents': 0,
    },

    // Add more friends with their image URLs and event counts as needed
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    // Filter friends based on search query
    final filteredFriends = friends.where((friend) {
      return friend['name'].toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6A1B9A), Color(0xFF8E24AA)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Hedieaty',
          style: TextStyle(
            fontFamily: 'Pacifico', // Ensure you have this font in your assets
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Set text color to white
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.person_add,
              color: Colors.white, // Set icon color to white
            ),
            tooltip: 'Add Friend',
            onPressed: () {
              // Implement add friend functionality
              _showAddFriendDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search for a friend...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.purple[50],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFriends.length,
              itemBuilder: (context, index) {
                final friend = filteredFriends[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.purple[50],
                  elevation: 5,
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10),
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(friend['image']),
                      onBackgroundImageError: (_, __) {
                        // Handle error if image fails to load
                      },
                    ),
                    title: Text(
                      friend['name'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.purple[900],
                      ),
                    ),
                    subtitle: friend['upcomingEvents'] > 0
                        ? Text(
                            'Upcoming Events: ${friend['upcomingEvents']}',
                            style: TextStyle(color: Colors.purple[800]),
                          )
                        : Text(
                            'No Upcoming Events',
                            style: TextStyle(color: Colors.purple[800]),
                          ),
                    trailing: friend['upcomingEvents'] > 0
                        ? CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.redAccent,
                            child: Text(
                              friend['upcomingEvents'].toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        : null,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              FriendEventsPage(friendName: friend['name']),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF6A1B9A),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'My Events'),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard), label: 'My Gifts'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/myEvents');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/myGifts');
          }
        },
      ),
    );
  }

  // Function to show a dialog to add a new friend
  void _showAddFriendDialog(BuildContext context) {
    String friendName = '';
    String friendImageUrl = '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add New Friend'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Friend Name'),
              onChanged: (value) {
                friendName = value;
              },
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Friend Image URL'),
              onChanged: (value) {
                friendImageUrl = value;
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (friendName.isNotEmpty && friendImageUrl.isNotEmpty) {
                setState(() {
                  friends.add({
                    'name': friendName,
                    'image': friendImageUrl,
                    'upcomingEvents': 0,
                  });
                });
                Navigator.pop(context);
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}

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
      'image':
          'https://mediaslide-europe.storage.googleapis.com/success/pictures/3344/12176/profile-1712055449-61620c38f337b5355ae94a26c62f3623.jpg',
      'upcomingEvents': 2,
      'events': [
        {
          'name': 'Birthday Party',
          'gifts': ['Laptop', 'Smartphone']
        },
        {
          'name': 'New Year Celebration',
          'gifts': ['Watch', 'Perfume']
        },
      ],
    },
    {
      'name': 'Heba Hesham',
      'image':
          'https://media.licdn.com/dms/image/v2/D5610AQF2_PUAdRFeQg/image-shrink_800/image-shrink_800/0/1706878825602?e=2147483647&v=beta&t=wZjIlnP6x2oFdq--OdW76e0VizChOpLHx548X4RVC_c',
      'upcomingEvents': 3,
      'events': [
        {
          'name': 'Wedding Anniversary',
          'gifts': ['Necklace', 'Rings']
        },
        {
          'name': 'Graduation',
          'gifts': ['Laptop', 'Books']
        },
        {
          'name': 'Baby Shower',
          'gifts': ['Baby Clothes', 'Toys']
        },
      ],
    },
    {
      'name': 'Sara W',
      'image':
          'https://www.face-agency.co.uk/sites/default/files/styles/teaser/public/2023-11/13_4.jpg?itok=KzYYPeZ6',
      'upcomingEvents': 1,
      'events': [
        {
          'name': 'Housewarming',
          'gifts': ['Coffee Maker', 'Blender']
        }
      ],
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
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
            fontFamily: 'Pacifico',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person_add, color: Colors.white),
            tooltip: 'Add Friend',
            onPressed: () {
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
                      onBackgroundImageError: (_, __) {},
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
                          builder: (context) => FriendEventsPage(
                            friendName: friend['name'],
                            events: friend['events'],
                          ),
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
                    'events': [],
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

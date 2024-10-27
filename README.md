Hedieaty 🎁
Hedieaty is a gift list management app that helps users streamline the process of creating, managing, and sharing wish lists for special occasions. From birthdays to weddings, users can create unique gift lists, view friend’s lists, and pledge to buy specific gifts. This Flutter app aims to make gift-giving joyful and organized by allowing users to add, modify, and pledge gifts in real-time.

Features
Friend and Event Management: Add friends, view their upcoming events, and check specific gift lists for each event.
Gift Pledge System: Users can pledge to buy gifts from a friend’s list, with visual indicators to show pledged vs. available gifts.
Real-Time UI Updates: Smooth interactions with dynamic updating for gift pledges.
Search and Filter: Quickly find friends by name and view upcoming events.
Customizable Friend List: Easily add friends by name and image URL.
Intuitive UI: Attractive design with gradients, icons, and color-coded indicators for easy navigation.

Getting Started
Prerequisites
Flutter SDK: Ensure you have Flutter installed. Flutter installation guide
IDE: Any Flutter-compatible IDE, such as VS Code or Android Studio.
Installation 

Key Files
main.dart: Initializes the app and sets up the navigation.
home_page.dart: Displays friends and provides search and add friend functionalities.
friend_events_page.dart: Lists the specific events for each friend and navigates to gift lists.
event_gifts_page.dart: Allows users to view and pledge gifts for a selected event.
Usage
Add Friends: Go to the home screen and use the “Add Friend” button to add friends by name and image URL.
View Events: Tap on a friend to view their upcoming events.
Pledge Gifts: Select a specific event to view the gift list and pledge to buy gifts. Pledged gifts are marked with a green check, and the UI updates in real-time.

Development Notes
State Management: Simple state management using setState.
Navigation: Uses Navigator.push to transition between pages.
Error Handling: Error handling for loading images, with a fallback if images are missing or invalid.
Responsive UI: The app adapts well to different screen sizes and orientations.
Future Enhancements
Firebase Integration: Add real-time database support for syncing friend lists and gifts.
User Authentication: Allow users to sign in and save their data across devices.
Notifications: Push notifications to alert users when friends pledge gifts.
Improved Search: Add filtering options by event date and gift category.

Contact
For any questions or support, please reach out to hebahesham102@gmail.com

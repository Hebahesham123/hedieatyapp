import 'package:flutter/material.dart';
import 'package:hedieatyapp/HomePage.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style:
              TextStyle(color: Colors.white), // Set title text color to white
        ),
        centerTitle: true,
        backgroundColor: Colors.purple, // Set AppBar background color to purple
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Welcome Text
            Text(
              'Welcome to Hedieaty App',
              style: TextStyle(
                fontSize: 30, // Increased font size
                fontWeight: FontWeight.bold,
                color: Colors.purple,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            // Network Image with larger size
            Image.network(
              'https://e1.pxfuel.com/desktop-wallpaper/21/251/desktop-wallpaper-friendship-friends-logo-png-friendship-logo.jpg', // Replace with your image URL
              height: 200, // Increased height
              width: 200, // Increased width
              fit: BoxFit.cover,
            ),
            SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Simulate login success and navigate to HomePage
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Login',
                  style: TextStyle(
                      color: Colors.white)), // Set text color to white
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.purple, // Set button background color to purple
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text(
                'Don\'t have an account? Sign Up',
                style: TextStyle(
                    color: const Color.fromARGB(
                        255, 0, 0, 0)), // Set link color to purple
              ),
            ),
          ],
        ),
      ),
    );
  }
}

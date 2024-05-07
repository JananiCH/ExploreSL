import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExploreSL',
      home: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Tourist Profile'),
        actions: [
          TextButton(
            onPressed: () {
              // Save profile changes
            },
            child: Text('Save'),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('https://st3.depositphotos.com/14847044/18260/i/380/depositphotos_182608538-stock-photo-happy.jpg'),
                ),
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Edit profile picture
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          ListTile(
            title: Text('NAME'),
            subtitle: Text('Carrie Sanders'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Edit name
            },
          ),
          ListTile(
            title: Text('EMAIL'),
            subtitle: Text('carrie_sanders@email.com'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Edit email
            },
          ),
          ListTile(
            title: Text('TITLE'),
            subtitle: Text('Principal Product Designer'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Edit title
            },
          ),
          ListTile(
            title: Text('country'),
            subtitle: Text('San Francisco, CA'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Edit location
	},
          ),
          ListTile(
            title: Text('mobile number'),
            subtitle: Text('+94 600 0271'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
            },//Edit number
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: const Text('Account'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Add account settings
            },
          ),
          ListTile(
            title: const Text('Notifications'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Add notification settings
            },
          ),
          ListTile(
            title: const Text('Privacy'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Add privacy settings
            },
          ),
          ListTile(
            title: const Text('About'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Add about page
            },
          ),
        ],
      ),
    );
  }
}

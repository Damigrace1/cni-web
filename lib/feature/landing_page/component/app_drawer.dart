
import 'package:cni_web/feature/landing_page/component/event_slider.dart';
import 'package:cni_web/feature/landing_page/controllers/home_controller.dart';
import 'package:cni_web/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Drawer header
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          // Drawer items
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              // Handle navigation to Home
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              // Handle navigation to Settings
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_page),
            title: const Text('Contact'),
            onTap: () {
              // Handle navigation to Contact
              Navigator.pop(context); // Close the drawer
            },
          ),
        ],
      ),
    );
  }
}
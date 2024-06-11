import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/views/screens/admin_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/notes_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/profile_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const DrawerHeader(
            curve: Curves.bounceInOut,
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                Text(
                  'Menyu',
                  style: TextStyle(fontSize: 50),
                ),
              ],
            ),
          ),
          ListTile(
            tileColor: Colors.amber,
            // splashColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AdminScreen()),
              );
            },
            title: const Text("Admin Panel"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            tileColor: Colors.amber,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotesScreen()),
              );
            },
            title: const Text("Settings"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          const SizedBox(
            height: 10,
          ),
          ListTile(
            tileColor: Colors.amber,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
            title: const Text("Profile"),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          )
        ],
      ),
    );
  }
}

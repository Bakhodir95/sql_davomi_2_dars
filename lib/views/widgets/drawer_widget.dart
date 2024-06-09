import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/views/screens/notes_screen.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const DrawerHeader(
              curve: Curves.bounceInOut,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menyu',
                style: TextStyle(fontSize: 30),
              ),
            ),
            ListTile(
              tileColor: Colors.amber,
              // splashColor: Colors.red,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotesScreen()),
                );
              },
              title: const Text("Admin Panel"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
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
            )
          ],
        ),
      ),
    );
  }
}

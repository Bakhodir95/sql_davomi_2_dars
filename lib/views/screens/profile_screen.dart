import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text("Settings"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            Container(
              padding: EdgeInsets.all(10),
              clipBehavior: Clip.hardEdge,
              alignment: Alignment.centerLeft,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                color: Color.fromARGB(255, 11, 244, 19),
              ),
              child: const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("images/w.png"),
              ),
            ),
          ])),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/views/screens/notes_screen.dart';

void main(List<String> args) {
  runApp(SqlData());
}

class SqlData extends StatelessWidget {
  const SqlData({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/views/widgets/notes_widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/todos_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.yellow,
        title: const Text("Todos"),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: TodosWidget()),
            Expanded(child: NotesWidget()),
          ],
        ),
      ),
    );
  }
}

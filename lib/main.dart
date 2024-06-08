import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/views/screens/home_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/notes_screen.dart';
import 'package:sql_davomi_2_dars/views/widgets/todos_widget.dart';

void main(List<String> args) {
  runApp(SqlData());
}

class SqlData extends StatelessWidget {
  const SqlData({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (ctx) => const MainScreen(),
        "/home": (ctx) => const MainScreen(),
        "/notes": (ctx) => const NotesScreen(),
        "/todos": (ctx) => const TodosWidget(),
      },
      debugShowCheckedModeBanner: false,
      // home: MainScreen(),
    );
  }
}

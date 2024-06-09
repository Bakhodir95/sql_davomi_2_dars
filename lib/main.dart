import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/views/screens/course_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/home_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/lessons_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/notes_screen.dart';
import 'package:sql_davomi_2_dars/views/widgets/course.widget.dart';
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
        "/": (ctx) => HomeScreen(),
        "/home": (ctx) => HomeScreen(),
        "/notes": (ctx) => NotesScreen(),
        "/todos": (ctx) => TodosWidget(),
        "/courses": (ctx) => CoursesWidget(),
        // "/lessons": (ctx) => LessonsScreen(),
      },
      debugShowCheckedModeBanner: false,
      // home: MainScreen(),
    );
  }
}

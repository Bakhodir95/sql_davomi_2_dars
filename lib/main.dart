import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/views/screens/home_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/notes_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/sign_in.dart';
import 'package:sql_davomi_2_dars/views/widgets/course.widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/todos_widget.dart';

void main(List<String> args) {
  runApp(const SqlData());
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
        "/notes": (ctx) => const NotesScreen(),
        "/todos": (ctx) => const TodosWidget(),
        "/courses": (ctx) => CoursesWidget(),
        // "/lessons": (ctx) => const SignIn(),
      },
      debugShowCheckedModeBanner: false,
      // home: MainScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/controllers/sign_in_controller.dart';
import 'package:sql_davomi_2_dars/views/screens/home_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/notes_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/sign_in.dart';
import 'package:sql_davomi_2_dars/views/widgets/course.widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/todos_widget.dart';

void main(List<String> args) {
  runApp(const SqlData());
}

class SqlData extends StatefulWidget {
  const SqlData({super.key});

  @override
  State<SqlData> createState() => _SqlDataState();
}

class _SqlDataState extends State<SqlData> {
  final _service = AuthhttpService();
  bool isloginLast = false;
  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  checkLogin() async {
    isloginLast = await _service.checkAuth();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: isloginLast ? '/home' : "/",
      routes: {
        "/": (ctx) => SignIn(),
        "/home": (ctx) => HomeScreen(),
        "/notes": (ctx) => const NotesScreen(),
        "/todos": (ctx) => const TodosWidget(),
        "/courses": (ctx) => CoursesWidget(),
        "/signIn": (ctx) => const SignIn(),
      },
      debugShowCheckedModeBanner: false,
      // home: MainScreen(),
    );
  }
}

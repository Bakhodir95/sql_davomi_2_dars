import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/controllers/sign_in_controller.dart';
import 'package:sql_davomi_2_dars/utils/appconst.dart';
import 'package:sql_davomi_2_dars/views/screens/home_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/notes_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/profile_screen.dart';
import 'package:sql_davomi_2_dars/views/screens/sign_in.dart';
import 'package:sql_davomi_2_dars/views/screens/sign_up.dart';
import 'package:sql_davomi_2_dars/views/widgets/course.widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/todos_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    print(isloginLast);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isloginLast
          ? HomeScreen(
              mainStateSet: () => setState(() {}),
            )
          : const SignIn(),
      routes: {
        "/notes": (ctx) => const NotesScreen(),
        "/todos": (ctx) => const TodosWidget(),
        "/courses": (ctx) => const CoursesWidget(),
        "/signIn": (ctx) => const SignIn(),
        "/signUp": (ctx) => const SignUpScreen(),
        "/profile": (ctx) => const ProfileScreen(),
      },
      debugShowCheckedModeBanner: false,
      locale: Locale(Appconst.language),
      title: "Localization",
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue.shade600,
      ),
    );
  }
}

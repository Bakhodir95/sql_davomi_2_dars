import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sql_davomi_2_dars/views/widgets/course.widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/drawer_widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/notes_widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/todos_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   filteredData = List.from(courses); // Initially, display all data
  // }

  @override
  Widget build(BuildContext contexst) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        actions: const [],
        // backgroundColor: Colors.deepPurple,
        // foregroundColor: Colors.yellow,
        title: Text(AppLocalizations.of(context)!.todos),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: TodosWidget()),
                Gap(20),
                Expanded(child: NotesWidget()),
              ],
            ),
            CoursesWidget(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        unselectedItemColor: Colors.blue,
        selectedItemColor: Colors.red,
        onTap: (value) => value,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: AppLocalizations.of(context)!.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

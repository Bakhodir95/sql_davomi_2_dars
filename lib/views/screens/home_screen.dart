import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sql_davomi_2_dars/models/course_model.dart';
import 'package:sql_davomi_2_dars/views/widgets/course.widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/drawer_widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/notes_widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/search_view_delegate.dart';
import 'package:sql_davomi_2_dars/views/widgets/todos_widget.dart';

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
      drawer: DrawerWidget(),
      appBar: AppBar(
        actions: [],
        // backgroundColor: Colors.deepPurple,
        // foregroundColor: Colors.yellow,
        title: const Text("Todos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
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

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sql_davomi_2_dars/views/widgets/course.widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/drawer_widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/notes_widget.dart';
import 'package:sql_davomi_2_dars/views/widgets/todos_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        // actions: [],
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.yellow,
        title: const Text("Todos"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
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

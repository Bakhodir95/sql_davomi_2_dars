import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/controllers/course_controller.dart';
import 'package:sql_davomi_2_dars/models/course_model.dart';
import 'package:sql_davomi_2_dars/views/screens/course_screen.dart';
import 'package:sql_davomi_2_dars/views/widgets/search_view_delegate.dart';

class CoursesWidget extends StatefulWidget {
  // const CoursesWidget({super.key, Key? ey});

  @override
  State<CoursesWidget> createState() => _CoursesWidgetState();
}

class _CoursesWidgetState extends State<CoursesWidget> {
  final _controller = CourseController();

  Map<String, bool> courseIdToFavorited = {};
  List<CourseModel> filteredData = []; // Changed to Map<String, bool>

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: _controller.getCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.hasData) {
            return const Center(child: Text("No data"));
          }
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          List<CourseModel> courses = snapshot.data!;
          if (filteredData.isNotEmpty) {
            courses = filteredData;
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text(
                      "Courses",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        filteredData.clear();
                        CourseModel? result = await showSearch(
                          context: context,
                          delegate: SearchViewDelegate(
                              snapshot.data!), // Pass snapshot.data
                        );
                        if (result != null) {
                          filteredData.add(result);
                        }
                        setState(() {});
                        print(result);
                      },
                      icon: Icon(Icons.search),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CourseScreen(course)));
                          },
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 250,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Image.network(
                                  course.imageUrl,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return const Text("Wait");
                                    }
                                  },
                                  width: double.infinity,
                                  height: 300,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              course.title,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  courseIdToFavorited.update(
                                    course.id,
                                    (value) => !value,
                                    ifAbsent: () => !course.isLike,
                                  );
                                });
                              },
                              icon: Icon(
                                courseIdToFavorited[course.id] ?? course.isLike
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: courseIdToFavorited[course.id] ??
                                        course.isLike
                                    ? Colors.red
                                    : null,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

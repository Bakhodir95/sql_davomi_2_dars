import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sql_davomi_2_dars/controllers/course_controller.dart';
import 'package:sql_davomi_2_dars/models/course_model.dart';
import 'package:sql_davomi_2_dars/views/screens/course_screen.dart';

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  CourseController courseController = CourseController();

  TextEditingController priceController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: courseController.getCourses(),
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Courses",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final course = snapshot.data![index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              course.title,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CourseScreen(course)));
                            },
                            child: Container(
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
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OutlinedButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "Edit",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w700),
                                  )),
                              const Gap(50),
                              FilledButton(
                                  onPressed: () {
                                    // courseController.deleteCourses(course.id);
                                    setState(() {});
                                  },
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ))
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final CourseModel response = await showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: const Text("Add Courses"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: titleController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "Title"),
                      ),
                      TextField(
                        controller: descController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Description"),
                      ),
                      TextField(
                        controller: imageUrlController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "ImageUrl"),
                      ),
                      TextField(
                        controller: priceController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(), labelText: "Price"),
                      )
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancel")),
                    FilledButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            CourseModel(
                              id: "",
                              price: priceController.text,
                              description: descController.text,
                              imageUrl: imageUrlController.text,
                              lessons: [],
                              title: titleController.text,
                            ),
                          );
                        },
                        child: const Text("Save"))
                  ],
                );
              });
          if (response != null) {
            //! Add new Courses
            print(response.title);
            titleController.clear();
            descController.clear();
            imageUrlController.clear();
            priceController.clear();
            await courseController.addCourses(response);
            setState(() {});
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/models/course_model.dart';
import 'package:sql_davomi_2_dars/views/screens/lessons_screen.dart';

class CourseScreen extends StatelessWidget {
  final CourseModel courseModel;

  CourseScreen(this.courseModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          courseModel.title,
          style: TextStyle(fontSize: 40),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 200,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              courseModel.imageUrl,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              fit: BoxFit.contain,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                courseModel.description,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${courseModel.price}.0",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Text(
            "Lessons",
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: courseModel.lessons.length,
            itemBuilder: (context, index) {
              final lesson = courseModel.lessons[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LessonsScreen(lesson),
                      ),
                    );
                  },
                  title: Text(lesson.title),
                  trailing: Icon(Icons.arrow_forward_ios_rounded),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

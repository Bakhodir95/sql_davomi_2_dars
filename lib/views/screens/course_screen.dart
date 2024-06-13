import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/models/course_model.dart';
import 'package:sql_davomi_2_dars/views/screens/lessons_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CourseScreen extends StatelessWidget {
  final CourseModel courseModel;

  const CourseScreen(this.courseModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          courseModel.title,
          style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                  return const Center(
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
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text(
                "\$${courseModel.price}.0",
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            AppLocalizations.of(context)!.lessons,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: courseModel.lessons.length,
            itemBuilder: (context, index) {
              final lesson = courseModel.lessons[index];
              return Column(children: [
                Card(
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
                    trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  ),
                ),
              ]);
            },
          ),
        ],
      ),
    );
  }
}

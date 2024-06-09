import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sql_davomi_2_dars/models/course_model.dart';
import 'package:sql_davomi_2_dars/models/lesson_model.dart';
import 'package:sql_davomi_2_dars/models/quiz_model.dart';

class CourseController {
  Future<List<CourseModel>> getCourses() async {
    final Uri url = Uri.parse(
        "https://todonote-912ed-default-rtdb.firebaseio.com/courses.json");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      List<CourseModel> courses = [];

      for (var entry in data.entries) {
        String courseId = entry.key;
        Map<String, dynamic> courseData = entry.value;

        List<LessonModel> lessons = await getLessonsByCourseId(courseId);

        CourseModel course = CourseModel(
          id: courseId,
          description: courseData['description'],
          imageUrl: courseData['imageUrl'],
          lessons: lessons,
          title: courseData['title'],
          price: courseData['price'].toString(),
        );
        print(course);
        courses.add(course);
      }

      return courses;
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<List<LessonModel>> getLessonsByCourseId(String courseId) async {
    final Uri url = Uri.parse(
        "https://todonote-912ed-default-rtdb.firebaseio.com/lessons.json");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      List<LessonModel> lessons = [];

      data.entries.forEach((entry) {
        String lessonId = entry.key;
        Map<String, dynamic> lessonData = entry.value;
        if (lessonData['courseId'] == courseId) {
          LessonModel lesson = LessonModel(
            id: lessonId,
            courseId: courseId,
            description: lessonData['description'],
            title: lessonData['title'],
            videoUrl: lessonData['videoUrl'],
            quizes: [
              QuizModel(
                id: "id",
                question: "question",
                options: ["options"],
                correctOptionIndex: 1,
              )
            ],
          );

          lessons.add(lesson);
        }
      });

      return lessons;
    } else {
      throw Exception('Failed to load lessons');
    }
  }
}

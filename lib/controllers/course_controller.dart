import 'dart:convert';

import 'package:sql_davomi_2_dars/models/course_model.dart';
import 'package:http/http.dart' as http;

class CourseController {
  Future<List<CourseModel>> getCourses() async {
    Uri url = Uri.parse(
        "https://todonote-912ed-default-rtdb.firebaseio.com/courses.json/");
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<CourseModel> courses = [];

    if (data != null) {
      data.forEach((key, value) {
        courses.add(CourseModel(
            id: key,
            description: value["description"],
            imageUrl: value["imageUrl"],
            lessons: value["lessons"],
            tittle: value["title"]));
      });
    }

    return courses;
  }

  Future<void> addCourses(
      String description, String imageUrl, String lessons, String title) async {
    Uri url = Uri.parse(
        "https://todonote-912ed-default-rtdb.firebaseio.com/courses.json/");
    final response = await http.post(url,
        body: jsonEncode(
          {
            "description": description,
            "imageUrl": imageUrl,
            "lessons": lessons,
            "title": title
          },
        ));
    final data = jsonDecode(response.body);
  }

  Future<void> editCourses(String id, String description, String imageUrl,
      String lessons, String title) async {
    Uri url = Uri.parse(
        "https://todonote-912ed-default-rtdb.firebaseio.com/courses/$id.json");

    final response = await http.patch(url,
        body: jsonEncode({
          "description": description,
          "imageUrl": imageUrl,
          "lessons": lessons,
          "title": title
        }));
  }

  Future<void> deleteCourses(String id) async {
    Uri url = Uri.parse(
        "https://todonote-912ed-default-rtdb.firebaseio.com/courses/$id.json");
    final respose = await http.delete(url);
  }
}

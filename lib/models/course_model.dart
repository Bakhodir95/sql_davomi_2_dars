import 'package:sql_davomi_2_dars/models/lesson_model.dart';

class CourseModel {
  String id;
  String title;
  String description;
  String imageUrl;
  List<LessonModel> lessons;
  String price;

  CourseModel({
    required this.id,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.lessons,
    required this.title,
  });
}

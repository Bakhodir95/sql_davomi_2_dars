import 'package:sql_davomi_2_dars/models/lesson_model.dart';

class CourseModel {
  int id;
  String tittle;
  String description;
  String imageUrl;
  List<LessonModel> lessons;
  CourseModel(
      {required this.id,
      required this.description,
      required this.imageUrl,
      required this.lessons,
      required this.tittle});
}

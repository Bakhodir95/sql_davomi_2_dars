import 'package:sql_davomi_2_dars/models/quiz_model.dart';

class LessonModel {
  int id;
  int courseId;
  String title;
  String description;
  String videoUrl;
  List<QuizModel> quizes;

  LessonModel(
      {required this.id,
      required this.courseId,
      required this.description,
      required this.title,
      required this.videoUrl,
      required this.quizes});
}

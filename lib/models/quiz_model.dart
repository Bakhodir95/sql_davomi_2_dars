class QuizModel {
  int id;
  String question;
  List<String> options;
  int correctOptionIndex;

  QuizModel(
      {required this.id,
      required this.question,
      required this.options,
      required this.correctOptionIndex});
}

class NoteModel {
  int id;
  String title;
  String description;
  DateTime createdData;

  NoteModel(
      {required this.title,
      required this.description,
      required this.id,
      required this.createdData});

  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
        id: map['id'] as int,
        title: map['title'].toString(),
        description: map['description'],
        createdData: DateTime.parse(
          map['createdData'],
        ));
  }
}

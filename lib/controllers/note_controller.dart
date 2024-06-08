import 'package:sql_davomi_2_dars/models/note_model.dart';
import 'package:sql_davomi_2_dars/services/local_database.dart';

class NoteController {
  final _localDatabase = LocalDatabase();

  List<NoteController> _list = [];
  List<NoteController> get list => [..._list];

  Future<List<NoteModel>> getNotes() async {
    final db = await _localDatabase.database;

    List<NoteModel> notes = [];
    List<Map<String, dynamic>> datas = await db.query("notes");

    for (var data in datas) {
      notes.add(NoteModel.fromMap(data));
    }
    return notes;
  }

  Future<void> addNotes(NoteModel note) async {
    final db = await _localDatabase.database;

    await db.insert("notes", {
      "title": note.title,
      "description": note.description,
      "createdData": note.createdData.toString()
    });
  }

  Future<void> editNotes(NoteModel note) async {
    final db = await _localDatabase.database;
    await db.update(
        "notes",
        {
          "title": note.title,
          "description": note.description,
          "createdData": note.createdData.toString()
        },
        where: "id=?",
        whereArgs: [note.id.toString()]);
    print("salom");
  }

  Future<void> deleteNotes(NoteModel note) async {
    final db = await _localDatabase.database;
    await db.delete("notes", where: "id=?", whereArgs: [note.id]);
  }
}

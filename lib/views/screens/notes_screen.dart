import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/controllers/note_controller.dart';
import 'package:sql_davomi_2_dars/models/note_model.dart';
import 'package:sql_davomi_2_dars/views/widgets/add_note.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final NoteController _noteController = NoteController();

  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();

  @override
  void initState() {
    super.initState();
    _getNotes();
  }

  Future<void> _getNotes() async {
    await _noteController.getNotes();
    setState(() {});
  }

  DateTime? timepicker;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.notes,
          style: TextStyle(
            color: Color.fromARGB(255, 22, 130, 26),
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: _noteController.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<NoteModel>? notes = snapshot.data;

          return notes == null || notes.isEmpty
              ? const Center(
                  child: Text("No notes yet!"),
                )
              : ListView.builder(
                  itemCount: notes.length,
                  itemBuilder: (ctx, index) {
                    return ListTile(
                      title: Text(notes[index].title),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(notes[index].description),
                          Text(notes[index].createdData.toString()),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () async {
                              NoteModel response = await showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text(
                                            AppLocalizations.of(context)!
                                                .addnotes),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              controller: _title,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText:
                                                      AppLocalizations.of(
                                                              context)!
                                                          .title),
                                            ),
                                            TextField(
                                              controller: _description,
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  labelText:
                                                      AppLocalizations.of(
                                                              context)!
                                                          .description),
                                            ),
                                            TextButton(
                                                onPressed: () async {
                                                  timepicker =
                                                      await showDatePicker(
                                                          context: context,
                                                          firstDate:
                                                              DateTime(2000),
                                                          lastDate:
                                                              DateTime(3000));
                                                  setState(() {});
                                                },
                                                child: Text(timepicker == null
                                                    ? AppLocalizations.of(
                                                            context)!
                                                        .enterdate
                                                    : "${timepicker!.year}-${timepicker!.month}-${timepicker!.day}"))
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                  AppLocalizations.of(context)!
                                                      .cancel)),
                                          FilledButton(
                                              onPressed: () {
                                                if (timepicker != null) {
                                                  Navigator.pop(
                                                    context,
                                                    NoteModel(
                                                        title: _title.text,
                                                        description:
                                                            _description.text,
                                                        id: notes[index].id,
                                                        createdData:
                                                            timepicker!),
                                                  );
                                                }
                                              },
                                              child: Text(
                                                  AppLocalizations.of(context)!
                                                      .save))
                                        ],
                                      ));

                              await _noteController.editNotes(response);

                              setState(() {});
                            },
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () async {
                              await _noteController.deleteNotes(notes[index]);
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          NoteModel response = await showDialog(
              context: context,
              builder: (context) => AddNote(
                    onAdd: () {
                      setState(() {});
                    },
                  ));
          await _noteController.addNotes(response);
          setState(() {});
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}

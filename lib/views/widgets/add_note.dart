import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/models/note_model.dart';

class AddNote extends StatefulWidget {
  Function() onAdd;
  AddNote({super.key, required this.onAdd});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _description = TextEditingController();

  DateTime? timepicker;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Notes"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _title,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Title"),
          ),
          TextField(
            controller: _description,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "Description"),
          ),
          TextButton(
              onPressed: () async {
                timepicker = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(3000));
                setState(() {});
              },
              child: Text(timepicker == null
                  ? "enter date"
                  : "${timepicker!.year}-${timepicker!.month}-${timepicker!.day}"))
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        FilledButton(
            onPressed: () {
              if (timepicker != null) {
                Navigator.pop(
                  context,
                  NoteModel(
                      title: _title.text,
                      description: _description.text,
                      id: 0,
                      createdData: timepicker!),
                );
                widget.onAdd();
              }
            },
            child: const Text("Save"))
      ],
    );
  }
}

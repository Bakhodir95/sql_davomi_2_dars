import 'package:flutter/material.dart';
import 'package:sql_davomi_2_dars/models/note_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      title: Text(
        AppLocalizations.of(context)!.addnotes,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _title,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: AppLocalizations.of(context)!.title,
            ),
          ),
          TextField(
            controller: _description,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: AppLocalizations.of(context)!.description,
            ),
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
                  ? AppLocalizations.of(context)!.enterdate
                  : "${timepicker!.year}-${timepicker!.month}-${timepicker!.day}"))
        ],
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)!.cancel,
            )),
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
            child: Text(
              AppLocalizations.of(context)!.save,
            ))
      ],
    );
  }
}

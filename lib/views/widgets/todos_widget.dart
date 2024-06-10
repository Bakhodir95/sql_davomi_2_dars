import 'package:flutter/material.dart';

class TodosWidget extends StatefulWidget {
  const TodosWidget({super.key});

  @override
  State<TodosWidget> createState() => _TodosWidgetState();
}

class _TodosWidgetState extends State<TodosWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, "/notes");
        },
        child: const Card(
            color: Colors.amber,
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Todo',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
            )));
  }
}

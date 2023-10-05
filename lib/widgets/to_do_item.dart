import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colours.dart';
import 'package:to_do_app/models/todo.dart';

class ToDoItem extends StatelessWidget {
  final Todo todo;
  final Function completed;
  final Function deleted;
  

  const ToDoItem({super.key, required this.todo, required this.completed, required this.deleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          completed(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: cwhite1,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: cblue,
        ),
        title: Text(
          todo.toDoText,
          style: TextStyle(
            fontSize: 18, 
            color: cblack,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            deleted(todo.id);
          },
          icon: const Icon(Icons.delete),
          color: cred,
          iconSize: 25,
        ),
      ),
    );
  }
}

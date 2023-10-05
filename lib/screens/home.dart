import 'package:flutter/material.dart';
import 'package:to_do_app/constants/colours.dart';
import 'package:to_do_app/widgets/to_do_item.dart';
import 'package:to_do_app/models/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = Todo.toDoList();
  final _todoController = TextEditingController();
  List<Todo> _foundTodo = [];

  @override
  void initState() {
    super.initState();
    _foundTodo = todoList;
  }

  void _handlechange(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deletItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addTodo(String toDo) {
    if (_todoController.text.isEmpty) {
      return;
    } else {
      setState(() {
        todoList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          toDoText: toDo,
        ));
      });
    }
    _todoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      backgroundColor: cwhite2,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 80,
              left: 20,
              right: 20,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                todoList.isEmpty
                                    ? 'No ToDos Yet!'
                                    : 'All ToDos',
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      for (Todo todoo in _foundTodo.reversed)
                        ToDoItem(
                          todo: todoo,
                          completed: _handlechange,
                          deleted: _deletItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 20,
                        right: 20,
                        left: 20,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.0),
                            blurRadius: 8.0,
                            spreadRadius: 0.0,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: _todoController,
                        decoration: const InputDecoration(
                          hintText: 'Add Something To Do',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    child: FloatingActionButton(
                      onPressed: () {
                        _addTodo(_todoController.text);
                      },
                      elevation: 5,
                      backgroundColor: cblue,
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

AppBar _appBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: cwhite2,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'MyToDo',
          style: TextStyle(
            color: cblack,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: 'Ubuntu',
          ),
        ),
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/profile.jpg'),
          ),
        ),
      ],
    ),
  );
}

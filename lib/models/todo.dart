
class Todo {
  String? id;
  String toDoText;
  bool isDone;

  Todo({
    required this.id,
    required this.toDoText,
    this.isDone = false,
  });
  
  static List<Todo> toDoList() {
    return [];
  }
}

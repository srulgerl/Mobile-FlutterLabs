import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Simple Todo App', home: TodoListScreen());
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> tasks = [];
  List<bool> isChecked = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo List')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder:
            (context, index) => CheckboxListTile(
              title: Text(
                tasks[index],
                style: TextStyle(
                  decoration:
                      isChecked[index] ? TextDecoration.lineThrough : null,
                ),
              ),
              value: isChecked[index],
              onChanged: (bool? value) {
                setState(() {
                  isChecked[index] = value!;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTask(),
        child: Icon(Icons.add),
      ),
    );
  }

  void _addTask() {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('New Task'),
            content: TextField(controller: controller),
            actions: [
              MaterialButton(
                child: Text('Add'),
                onPressed: () {
                  setState(() {
                    tasks.add(controller.text);
                    isChecked.add(false);
                    controller.clear();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
    );
  }
}

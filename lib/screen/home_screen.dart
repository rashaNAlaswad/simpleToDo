import 'package:flutter/material.dart';

import '../components/task_list.dart';
import '../components/text_field.dart';
import '../model/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskManager taskManager = TaskManager();
  final _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Simple ToDo'),
      ),
      body: TaskListWidget(
        taskManager: taskManager,
        onCompleted: (index) {
          setState(() {
            taskManager.completeTask(index);
          });
        },
        onRemove: (index) {
          setState(() {
            taskManager.removeTask(index);
          });
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFieldWidget(controller: _textFieldController),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (_textFieldController.text.isNotEmpty) {
                    taskManager.addTask(_textFieldController.text);
                    _textFieldController.clear();
                  }
                });
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

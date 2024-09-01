import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.taskManager,
    required this.onCompleted,
    required this.index,
  });

  final TaskManager taskManager;
  final int index;
  final Function(int index) onCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      child: Row(
        children: [
          Checkbox(
            value: taskManager.taskList[index].isCompleted,
            onChanged: (value) {
              onCompleted(index);
            },
          ),
          Text(
            taskManager.taskList[index].taskName,
            style: TextStyle(
                fontSize: 16,
                decoration: taskManager.taskList[index].isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
        ],
      ),
    );
  }
}

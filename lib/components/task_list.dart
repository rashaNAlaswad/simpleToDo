import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:simple_to_do/model/task.dart';

import 'task_item.dart';

class TaskListWidget extends StatelessWidget {
  const TaskListWidget({
    super.key,
    required this.taskManager,
    required this.onCompleted,
    required this.onRemove,
  });

  final TaskManager taskManager;
  final Function(int) onCompleted;
  final Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: taskManager.taskList.length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    onRemove(index);
                  },
                  icon: Icons.delete,
                  borderRadius: BorderRadius.circular(16),
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            child: TaskItemWidget(
                taskManager: taskManager,
                onCompleted: onCompleted,
                index: index),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }
}

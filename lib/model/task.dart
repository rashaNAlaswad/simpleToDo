class Task {
  late String taskName;
  late bool isCompleted;

  Task({required this.taskName, this.isCompleted = false});
}

class TaskManager {
  final _taskList = [
    Task(taskName: 'Study Flutter'),
    Task(taskName: 'Do Homework'),
  ];

  List<Task> get taskList => _taskList;

  void addTask(String taskName) {
    taskList.add(Task(taskName: taskName));
  }

  void removeTask(int index) {
    taskList.removeAt(index);
  }

  void completeTask(int index) {
    taskList[index].isCompleted = !taskList[index].isCompleted;
  }
}

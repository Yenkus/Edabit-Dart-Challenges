void main(List<String> arguments) {
  Task task = Task(
    taskTitle: 'shrimp',
  );
  NCategory nCat = NCategory(categoryName: 'CatName', categoryKey: 'CatKey');
  TaskDetails taskDetails = TaskDetails();
  for (int i = 0; i < 10; i++) {
    nCat.addTask(newTaskTitle: 'Task$i', keyList: [], description: '');
  }

  for (int i = 0; i < nCat.listOfTasks.length; i++) {
    print(nCat.listOfTasks[i].taskTitle);
  }
  Task tempTask = nCat.listOfTasks[3];
  TaskDetails tesa = TaskDetails(task: nCat.listOfTasks[9]);
  print('This is the temp task: ${tempTask.taskTitle}');
  tempTask.taskTitle = 'Re-Edited Task';
  print('This is the temp task: ${tempTask.taskTitle}');
  print('Task at original position ${nCat.listOfTasks[5].taskTitle}');

  print('Tesa: ${tesa.task!.taskTitle}');
  for (int i = 0; i < 10; i++) {
    print(nCat.listOfTasks[i].taskTitle);
  }

  taskDetails.task = nCat.listOfTasks[5];
  taskDetails.task!.taskTitle = 'Task Details edit on main';
  print('Task Details: ${taskDetails.task!.taskTitle}');

  print('Task at original position ${nCat.listOfTasks[5].taskTitle}');
  print('Tesa: ${tesa.task!.taskTitle}');
  for (int i = 0; i < 10; i++) {
    print(nCat.listOfTasks[i].taskTitle);
  }
  nCat.listOfTasks.insert(9, Task(taskTitle: 'Inserted element'));
  tesa.task!.taskTitle = 'Tesa rules';
  print('Tesa: ${tesa.task!.taskTitle}');

  for (int i = 0; i < nCat.listOfTasks.length; i++) {
    print(nCat.listOfTasks[i].taskTitle);
  }
  print('Tesa: ${tesa.task!.taskTitle}');
}

class Task {
  String taskTitle;
  bool checkbox;
  String? description;
  List? comment;
  List<Task>? subtask;

  Task(
      {this.checkbox = false,
      required this.taskTitle,
      this.description = '',
      this.comment,
      this.subtask});
  Task.lastSubtask({
    this.checkbox = false,
    required this.taskTitle,
    this.description = '',
    this.comment,
  });
}

class NCategory {
  String categoryName;
  String categoryKey;

  List<Task> listOfTasks = [];

  NCategory({required this.categoryName, required this.categoryKey});

  void addTask({
    required String newTaskTitle,
    required List<String> keyList,
    required String description,
  }) {
    listOfTasks.add(Task(
      taskTitle: newTaskTitle,
    ));
  }
}

class TaskDetails {
  Task? task;
  // Category? category;
  final int? categoryIndex;
  final int? mainIndex;
  final int? subIndex;
  final int? secondSubIndex;
  final int? thirdSubIndex;
  final int? fourthSubIndex;
  // final Widget? child;

  TaskDetails({
    this.task,
    // this.category,
    this.categoryIndex,
    this.mainIndex,
    // this.child,
    this.subIndex,
    this.secondSubIndex,
    this.thirdSubIndex,
    this.fourthSubIndex,
  });
}

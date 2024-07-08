void main(List<String> arguments) {
  Task task = Task(
    taskTitle: 'shrimp',
  );
  // Category category = Category(
  //   categoryName: '',
  //   listOfTasks: [
  //     Task(taskTitle: 'school'),
  //     Task(taskTitle: 'Trending'),
  //   ],
  // );
  Categories categories = Categories();

  print(categories.categoriesList[0].categoryName);

  categories.addCategory(categoryName: 'second');

  print(categories.categoriesList[1].categoryName);

  // print(categories.categoriesList[0].listOfTasks![0].subtask!.length);
  // // list of 1st tasks of each category
  // for (int i = 0; i < categories._listOfCategories.length; i++) {
  //   // print(categories.listOfCategories[i].listOfTasks[0].taskTitle);
  // }
  // // list of tasks for one category
  // for (int i = 0;
  //     i < categories._listOfCategories[0].listOfTasks!.length;
  //     i++) {
  //   print(categories._listOfCategories[0].listOfTasks![i].taskTitle);
  // }
  // print(categories.listOfCategories[0].listOfTasks[0].subtask!.taskTitle);
}

// Single task
class Task {
  String taskTitle;
  bool checkbox;
  String? description;
  List? comment;
  // Duration duration;
  // deadline;
  // occurence;
  // priority;
  // reminder;
  // dependencies;
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

// List of tasks
class Category {
  String categoryName;
  List<Task>? listOfTasks;
  // Map<Task, Category> task;

  Category({required this.categoryName, this.listOfTasks});

  // Method to add task
  void addTask(
      {required String newTaskTitle,
      String? description,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    // edit main task title
    if (subIndex == null) {
      listOfTasks!.add(Task(taskTitle: newTaskTitle, description: description));
    } else if (sencondSubIndex == null) {
      listOfTasks![mainIndex]
          .subtask!
          .add(Task(taskTitle: newTaskTitle, description: description));
    } else if (thirdSubIndex == null) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask!
          .add(Task(taskTitle: newTaskTitle, description: description));
    } else if (fourtIndex == null) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex]
          .subtask!
          .add(Task(taskTitle: newTaskTitle, description: description));
    } else {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex]
          .subtask![thirdSubIndex]
          .subtask!
          .add(Task.lastSubtask(
              taskTitle: newTaskTitle, description: description));
    }
  }

  // Method to edit task name
  void editTaskName(
      {required String editedTaskTitle,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    // edit main task title
    if (subIndex == null) {
      listOfTasks![mainIndex].taskTitle = editedTaskTitle;
    } else if (sencondSubIndex == null &&
        listOfTasks![mainIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex].subtask![subIndex].taskTitle = editedTaskTitle;
    } else if (thirdSubIndex == null &&
        listOfTasks![mainIndex].subtask![subIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex!]
          .taskTitle = editedTaskTitle;
    } else if (fourtIndex == null &&
        listOfTasks![mainIndex]
            .subtask![subIndex]
            .subtask![sencondSubIndex!]
            .taskTitle
            .isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex]
          .subtask![thirdSubIndex!]
          .taskTitle = editedTaskTitle;
    } else {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex!]
          .subtask![thirdSubIndex!]
          .subtask![fourtIndex!]
          .taskTitle = editedTaskTitle;
    }
  }

  // Method change the value of a task checkbox
  void changeCheckBoxStatus(
      {required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourthIndex}) {
    // edit main task title
    if (subIndex == null) {
      listOfTasks![mainIndex].checkbox = !listOfTasks![mainIndex].checkbox;
    } else if (sencondSubIndex == null &&
        listOfTasks![mainIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex].subtask![subIndex].checkbox =
          !listOfTasks![mainIndex].subtask![subIndex].checkbox;
    } else if (thirdSubIndex == null &&
        listOfTasks![mainIndex].subtask![subIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex]
              .subtask![subIndex]
              .subtask![sencondSubIndex!]
              .checkbox =
          !listOfTasks![mainIndex]
              .subtask![subIndex]
              .subtask![sencondSubIndex]
              .checkbox;
    } else if (fourthIndex == null &&
        listOfTasks![mainIndex]
            .subtask![subIndex]
            .subtask![sencondSubIndex!]
            .taskTitle
            .isNotEmpty) {
      listOfTasks![mainIndex]
              .subtask![subIndex]
              .subtask![sencondSubIndex]
              .subtask![thirdSubIndex!]
              .checkbox =
          !listOfTasks![mainIndex]
              .subtask![subIndex]
              .subtask![sencondSubIndex]
              .subtask![thirdSubIndex]
              .checkbox;
    } else {
      listOfTasks![mainIndex]
              .subtask![subIndex]
              .subtask![sencondSubIndex!]
              .subtask![thirdSubIndex!]
              .subtask![fourthIndex!]
              .checkbox =
          !listOfTasks![mainIndex]
              .subtask![subIndex]
              .subtask![sencondSubIndex]
              .subtask![thirdSubIndex]
              .subtask![fourthIndex]
              .checkbox;
    }
  }

  // Method to edit task description
  void editTaskDescription(
      {required String newDescription,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    // edit main task title
    if (subIndex == null) {
      listOfTasks![mainIndex].description = newDescription;
    } else if (sencondSubIndex == null &&
        listOfTasks![mainIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex].subtask![subIndex].description = newDescription;
    } else if (thirdSubIndex == null &&
        listOfTasks![mainIndex].subtask![subIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex!]
          .description = newDescription;
    } else if (fourtIndex == null &&
        listOfTasks![mainIndex]
            .subtask![subIndex]
            .subtask![sencondSubIndex!]
            .taskTitle
            .isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex]
          .subtask![thirdSubIndex!]
          .description = newDescription;
    } else {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex!]
          .subtask![thirdSubIndex!]
          .subtask![fourtIndex!]
          .description = newDescription;
    }
  }

  // Method to add comments
  void addComment(
      {required String newComment,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    // edit main task title
    if (subIndex == null) {
      listOfTasks![mainIndex].comment!.add(newComment);
    } else if (sencondSubIndex == null &&
        listOfTasks![mainIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex].subtask![subIndex].comment!.add(newComment);
    } else if (thirdSubIndex == null &&
        listOfTasks![mainIndex].subtask![subIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex!]
          .comment!
          .add(newComment);
    } else if (fourtIndex == null &&
        listOfTasks![mainIndex]
            .subtask![subIndex]
            .subtask![sencondSubIndex!]
            .taskTitle
            .isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex]
          .subtask![thirdSubIndex!]
          .comment!
          .add(newComment);
    } else {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex!]
          .subtask![thirdSubIndex!]
          .subtask![fourtIndex!]
          .comment!
          .add(newComment);
    }
  }

  // Method to edit task comments
  void editTaskComments(
      {required String newComment,
      required int commentIndex,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    // edit main task title
    if (subIndex == null) {
      listOfTasks![mainIndex].comment![commentIndex] = newComment;
    } else if (sencondSubIndex == null &&
        listOfTasks![mainIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex].subtask![subIndex].comment![commentIndex] =
          newComment;
    } else if (thirdSubIndex == null &&
        listOfTasks![mainIndex].subtask![subIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex!]
          .comment![commentIndex] = newComment;
    } else if (fourtIndex == null &&
        listOfTasks![mainIndex]
            .subtask![subIndex]
            .subtask![sencondSubIndex!]
            .taskTitle
            .isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex]
          .subtask![thirdSubIndex!]
          .comment![commentIndex] = newComment;
    } else {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex!]
          .subtask![thirdSubIndex!]
          .subtask![fourtIndex!]
          .comment![commentIndex] = newComment;
    }
  }

  // Delete task
  void deleteTask(
      {required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    // edit main task title
    if (subIndex == null) {
      listOfTasks!.removeAt(mainIndex);
    } else if (sencondSubIndex == null &&
        listOfTasks![mainIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex].subtask!.removeAt(subIndex);
    } else if (thirdSubIndex == null &&
        listOfTasks![mainIndex].subtask![subIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask!
          .removeAt(sencondSubIndex!);
    } else if (fourtIndex == null &&
        listOfTasks![mainIndex]
            .subtask![subIndex]
            .subtask![sencondSubIndex!]
            .taskTitle
            .isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex]
          .subtask!
          .removeAt(thirdSubIndex!);
    } else {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex!]
          .subtask![thirdSubIndex!]
          .subtask!
          .removeAt(fourtIndex!);
    }
  }

  // Delete comment
  void deleteTaskComments(
      {required int commentIndex,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    // edit main task title
    if (subIndex == null) {
      listOfTasks![mainIndex].comment!.removeAt(commentIndex);
    } else if (sencondSubIndex == null &&
        listOfTasks![mainIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .comment!
          .removeAt(commentIndex);
    } else if (thirdSubIndex == null &&
        listOfTasks![mainIndex].subtask![subIndex].taskTitle.isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex!]
          .comment!
          .removeAt(commentIndex);
    } else if (fourtIndex == null &&
        listOfTasks![mainIndex]
            .subtask![subIndex]
            .subtask![sencondSubIndex!]
            .taskTitle
            .isNotEmpty) {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex]
          .subtask![thirdSubIndex!]
          .comment!
          .removeAt(commentIndex);
    } else {
      listOfTasks![mainIndex]
          .subtask![subIndex]
          .subtask![sencondSubIndex!]
          .subtask![thirdSubIndex!]
          .subtask![fourtIndex!]
          .comment!
          .removeAt(commentIndex);
    }
  }
  // Delete subtask
}

// List of List of tasks
class Categories {
  final List<Category> _listOfCategories = [Category(categoryName: 'Main')];

  // get list of category
  List<Category> get categoriesList => _listOfCategories;

  // Add new category
  void addCategory({required String categoryName}) {
    _listOfCategories.add(Category(categoryName: categoryName));
  }

  // Edit category name
  void editCategoryName(
      {required String newCategoryName, required int categoryIndex}) {
    _listOfCategories[categoryIndex].categoryName = newCategoryName;
  }

  // Add task to category
  void addTaskToCategory(
      {required int categoryIndex,
      required String newTaskTitle,
      String? description,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    _listOfCategories[categoryIndex].addTask(
        newTaskTitle: newTaskTitle,
        mainIndex: mainIndex,
        description: description,
        subIndex: subIndex,
        sencondSubIndex: sencondSubIndex,
        thirdSubIndex: thirdSubIndex,
        fourtIndex: fourtIndex);
  }

  // Edit category tasks name
  void editCategoryTaskNameDetails(
      {required int categoryIndex,
      required String editedTaskTitle,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    _listOfCategories[categoryIndex].editTaskName(
        editedTaskTitle: editedTaskTitle,
        mainIndex: mainIndex,
        subIndex: subIndex,
        sencondSubIndex: sencondSubIndex,
        thirdSubIndex: thirdSubIndex,
        fourtIndex: fourtIndex);
  }

  // change category task checkbox value
  void changeCategoryCheckBoxValue(
      {required int categoryIndex,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourthIndex}) {
    _listOfCategories[categoryIndex].changeCheckBoxStatus(
        mainIndex: mainIndex,
        subIndex: subIndex,
        sencondSubIndex: sencondSubIndex,
        thirdSubIndex: thirdSubIndex,
        fourthIndex: fourthIndex);
  }

  // Edit category task description
  void editCategoryTaskDescription(
      {required int categoryIndex,
      required String newDescription,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    _listOfCategories[categoryIndex].editTaskDescription(
        newDescription: newDescription,
        mainIndex: mainIndex,
        subIndex: subIndex,
        sencondSubIndex: sencondSubIndex,
        thirdSubIndex: thirdSubIndex,
        fourtIndex: fourtIndex);
  }

  // Delete category
  void deleteCategory({required int categoryIndex}) {
    _listOfCategories.removeAt(categoryIndex);
  }

  // Add comment to task in a category
  void addCommentToTask(
      {required int categoryIndex,
      required String newComment,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    _listOfCategories[categoryIndex].addComment(
        newComment: newComment,
        mainIndex: mainIndex,
        subIndex: subIndex,
        sencondSubIndex: sencondSubIndex,
        thirdSubIndex: thirdSubIndex,
        fourtIndex: fourtIndex);
  }

  // Edit task comment in a category
  void editCategoryTaskComment(
      {required int categoryIndex,
      required String newComment,
      required int commentIndex,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    _listOfCategories[categoryIndex].editTaskComments(
        newComment: newComment,
        commentIndex: commentIndex,
        mainIndex: mainIndex,
        subIndex: subIndex,
        sencondSubIndex: sencondSubIndex,
        thirdSubIndex: thirdSubIndex,
        fourtIndex: fourtIndex);
  }

  // Delete task in a category
  void deleteTaskInCategory(
      {required int categoryIndex,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    _listOfCategories[categoryIndex].deleteTask(
        mainIndex: mainIndex,
        subIndex: subIndex,
        sencondSubIndex: sencondSubIndex,
        thirdSubIndex: thirdSubIndex,
        fourtIndex: fourtIndex);
  }

  // Delete comment in a category
  void deleteCommentInTask(
      {required int categoryIndex,
      required int commentIndex,
      required int mainIndex,
      int? subIndex,
      int? sencondSubIndex,
      int? thirdSubIndex,
      int? fourtIndex}) {
    _listOfCategories[categoryIndex].deleteTaskComments(
        commentIndex: commentIndex,
        mainIndex: mainIndex,
        subIndex: subIndex,
        sencondSubIndex: sencondSubIndex,
        thirdSubIndex: thirdSubIndex,
        fourtIndex: fourtIndex);
  }

  // Delete subtask subtask in a category
}

class TODOModel {
  //declare variable
  String title;
  bool isCompleted;

  //calling constructor for passing values
  TODOModel({required this.title, required this.isCompleted});

  //creating toggle method into class.
  //when isCompleted is false, then it will be changed true
  //When isCompleted is true, then it will be changed false
  void toggleCompleted() {
    isCompleted = !isCompleted;
  }
}

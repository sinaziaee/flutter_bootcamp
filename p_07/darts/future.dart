void main() {
  performTasks();
}

void performTasks() {
  task1();
  task2();
  task3();
  // ***** //
  // String result = task2();
  // task3(result);

}

void task1() {
  print('Task 1 is completed');
  //
}

void task2() {
  print('Task 2 is completed');
  // //***************************************** sleep is synchronous **********************************************//
  // Duration duration = Duration(seconds: 3);
  // sleep(duration);
  // print('Task 2 is completed');
  // //***************************************** Asynchronous in action **********************************************//
  // Duration duration = Duration(seconds: 3);
  // Future.delayed(duration, () {
  //   print('Task 2 is completed');
  // });
}

void task3() {
  print('Task 3 is completed');
}

// String task2() {
//   Duration duration = Duration(seconds: 3);
//   String result = '-1';
//   Future.delayed(duration, () {
//     result = 'task 2 data';
//     print('Task 2 is completed');
//   });
//   return result;
// }
//
// void task3(String task2Data) {
//   print('Task 3 is completed with $task2Data');
// }

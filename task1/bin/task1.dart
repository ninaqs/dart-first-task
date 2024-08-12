import 'dart:io';

import 'package:task1/task1.dart' as task1;

void main(List<String> arguments) {
  //input from user:
  List<int> user_grades = get_grades();

  //test
  List<int> grades = [66, 79, 80, 81, 77];

  if (verify_grades(grades) == false) {
    print("There is an error in grades values.");
  } else {
    double average = calculate_average(grades);

    print_message(average);
    print("Your grades are $grades");
  }
}

bool verify_grades(List<int> grades) {
  for (int grade in grades) {
    if (grade < 0 || grade > 100) {
      return false;
    }
  }

  return true;
}

double calculate_average(List<int> grades) {
  int sum = 0;
  for (int grade in grades) {
    sum += grade;
  }

  return sum / grades.length;
}

void print_message(double average) {
  String message = '';

  if (average > 90) {
    message = "Excellent";
  } else if (average > 80 && average < 90) {
    message = "Very Good";
  } else if (average > 70 && average < 80) {
    message = "Good";
  } else if (average > 50 && average < 70) {
    message = "Pass";
  } else {
    message = "Fail";
  }

  print("Your average is: $average, and your band discription is: $message");
}

List<int> get_grades() {
  print('Number of grades:');
  int length = int.parse(stdin.readLineSync()!);
  List<int> grades = [];
  for (int i = 0; i < length; i++) {
    int grade = int.parse(stdin.readLineSync()!);
    grades.add(grade);
  }

  return grades;
}

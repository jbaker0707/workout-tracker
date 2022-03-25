import 'package:flutter/cupertino.dart';

class WorkoutField {
  static const creationTime = 'creationTime';
}

class Workout {
  DateTime creationTime;
  String workout;
  String id;
  String sets;
  bool isCompleted;

  Workout({
    required this.creationTime,
    required this.workout,
    this.sets = '',
    required this.id,
    this.isCompleted = false,
  });
}
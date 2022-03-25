import 'package:flutter/cupertino.dart';
import 'package:fitnessapp/workout.dart';

class WorkoutProvider extends ChangeNotifier{

  List<Workout> _workouts = [

   



  ];

  List<Workout> get workouts => _workouts.where((workout) => workout.isCompleted == false).toList();

  List<Workout> get workoutsCompleted =>
      _workouts.where((workout) => workout.isCompleted == true ).toList();

void addWorkout(Workout workout){
  _workouts.add(workout);

  notifyListeners();
}

void removeWorkout(Workout workout){
  _workouts.remove(workout);

  notifyListeners();

}

bool toggleWorkoutStatus(Workout workout){
    workout.isCompleted = !workout.isCompleted;
    notifyListeners();
    return workout.isCompleted;
}

void saveWorkout(Workout workout, String exercises, String sets){
workout.workout = exercises;
workout.sets = sets;

notifyListeners();

}


}
import 'package:fitnessapp/workout.dart';
import 'package:flutter/material.dart';
import 'package:fitnessapp/workout_form_widget.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/workouts.dart';
import 'package:fitnessapp/workout_form_widget.dart';



class AddWorkoutDialogWidget extends StatefulWidget{
  @override
  _AddWorkoutDialogWidgetState createState() => _AddWorkoutDialogWidgetState();
}

class _AddWorkoutDialogWidgetState extends State<AddWorkoutDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String workout = '';
  String sets = '';

  @override
  Widget build(BuildContext context) =>
      AlertDialog(
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Add Exercise',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 24,
                  )
              ),

              const SizedBox(height: 8),
              WorkoutFormWidget(
                whenChangedWorkout: (workout) =>
                    setState(() => this.workout = workout),
                whenChangedSets:
                    (sets) => setState(() => this.sets = sets),
                whenSavedWorkout: addWorkout,
              ),
            ],
          ),
        ),
      );


  void addWorkout() {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final workouts = Workout(
        id: DateTime.now().toString(),
        workout: workout,
        sets: sets,
        creationTime: DateTime.now(),
      );

      final provider = Provider.of<WorkoutProvider>(context, listen: false);
      provider.addWorkout(workouts);

      Navigator.of(context).pop();
    }
  }

}
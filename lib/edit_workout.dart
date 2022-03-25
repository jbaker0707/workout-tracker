import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/workout.dart';
import 'package:fitnessapp/workouts.dart';
import 'package:fitnessapp/workout_form_widget.dart';

class EditWorkout extends StatefulWidget {
  final Workout workout;

  const EditWorkout({Key? key, required this.workout}) : super(key: key);

  @override
  _EditWorkoutState createState() => _EditWorkoutState();
}

class _EditWorkoutState extends State<EditWorkout>{
  final _formKey = GlobalKey<FormState>();
  String? workout;
  String? sets;

@override
void initState() {
  super.initState();

  workout = widget.workout.workout;
  sets = widget.workout.sets;

}
  @override
  Widget build(BuildContext context) => Scaffold(

appBar: AppBar(
      title: Text('Edit exercise'),
      actions: [
        IconButton(
        icon: Icon(Icons.delete),
          onPressed: (){
            final provider =
            Provider.of<WorkoutProvider>(context, listen: false);
            provider.removeWorkout(widget.workout);

            Navigator.of(context).pop();
                    },
        )
  ],

          ),
    body: Padding(
      padding: EdgeInsets.all(16),
    child: WorkoutFormWidget(
      workout: workout!,
      sets: sets!,
      whenChangedWorkout: (workout) => setState(() => this.workout = workout),
      whenChangedSets: (sets) =>
          setState(() => this.sets = sets),
      whenSavedWorkout: saveWorkout,
    ),
),
  );

  void saveWorkout() {
    final isValid = _formKey.currentState?.validate();

    if (!isValid!) {
      return;
    } else {
      final provider = Provider.of<WorkoutProvider>(context, listen: false);

      provider.saveWorkout(widget.workout, workout!, sets!);

      Navigator.of(context).pop();
    }
  }






}







import 'package:flutter/material.dart';

class WorkoutFormWidget extends StatelessWidget{
  final String workout;
  final String sets;
  final ValueChanged<String> whenChangedWorkout;
  final ValueChanged<String> whenChangedSets;
  final VoidCallback whenSavedWorkout;

  const WorkoutFormWidget({
    Key? key,
    this.workout='',
    this.sets = '',

    required this.whenChangedWorkout,
    required this.whenChangedSets,
    required this.whenSavedWorkout,
}) : super(key: key);

  @override
  Widget build(BuildContext context)  => SingleChildScrollView(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildWorkout(),
        SizedBox(height: 10),
        buildSets(),
        SizedBox(height: 30),
        buildButton(),
  ],
      ),
  );
Widget buildWorkout() => TextFormField(
    initialValue: workout,
    onChanged: whenChangedWorkout ,
            decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Workout',
      ),
);

Widget buildSets() => TextFormField(
  initialValue: sets,
  onChanged: whenChangedSets,
  maxLines: 5,
  decoration: InputDecoration(
    border: UnderlineInputBorder(),
    labelText: 'Sets',
  ),
);

Widget buildButton() => ElevatedButton(
  style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.green),
    ),
    onPressed: whenSavedWorkout,
  child: Text('Save Exercise'),
  );



}
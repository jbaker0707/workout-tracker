import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/workout.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fitnessapp/workouts.dart';
import 'package:fitnessapp/utility.dart';
import 'package:fitnessapp/edit_workout.dart';


class WorkoutWidget extends StatelessWidget{
  final Workout workout;

  const WorkoutWidget({
    required this.workout,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(

    actionPane: SlidableDrawerActionPane(),
    key: Key(workout.id),

    actions: [
      IconSlideAction(
    color: Colors.lightGreen,
        onTap: () => editWorkout(context, workout),
        caption: 'Edit',
        icon: Icons.edit,
      )
    ],
    secondaryActions: [
      IconSlideAction(
      color: Colors.red,
      onTap: () => deleteWorkout(context, workout),
      caption: 'Delete',
      icon: Icons.delete,
      )

    ],

    child: buildWorkout(context),
  );




  Widget buildWorkout(BuildContext context) => Container(

  color: Colors.white,
  padding: EdgeInsets.all(10),
      child: Row(
    children: [
      Checkbox(
        activeColor: Theme.of(context).primaryColor,
        checkColor: Colors.black,
        value: workout.isCompleted,
        onChanged: (_){
          final provider =
          Provider.of<WorkoutProvider>(context, listen: false);
          final isCompleted = provider.toggleWorkoutStatus(workout);
          Utility.showSnackBar(context,
           isCompleted ?   'Finished the exercise' : 'Exercise is not finished',
          );
        },
      ),
      const SizedBox(width: 20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(
              workout.workout,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                  fontSize: 20,
                ),
              ),
            if (workout.sets.isNotEmpty)
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Text(
                workout.sets,
                  style: TextStyle(fontSize: 18, height: 1.25),

              ),
              )
          ],
        ),
      ),
  ],
    
      ),
  );
  void deleteWorkout(BuildContext context, Workout workout) {
    final provider = Provider.of<WorkoutProvider>(context, listen: false);
    provider.removeWorkout(workout);

    Utility.showSnackBar(context, 'Deleted the exercise');
  }

  void editWorkout(BuildContext context, Workout workout) => Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => EditWorkout(workout: workout),
    ),
  );


}
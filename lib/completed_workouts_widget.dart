import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/workouts.dart';
import 'workout_widget.dart';

class CompletedWorkoutsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context){

    final provider = Provider.of<WorkoutProvider>(context);
    final workouts = provider.workoutsCompleted;

    return workouts.isEmpty
        ? Center(
      child: Text(
        'No finished exercises',
        style: TextStyle(fontSize: 18),
      ),
    )

        : ListView.separated(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Container(height: 4),
      itemCount: workouts.length,
      itemBuilder: (context, index) {
        final workout = workouts[index];

        return WorkoutWidget(workout: workout);
      },
    );
  }

}
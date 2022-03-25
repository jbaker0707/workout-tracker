import 'package:fitnessapp/workouts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/workout.dart';
import 'package:fitnessapp/workout_widget.dart';

class WorkoutListWidget extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      final provider = Provider.of<WorkoutProvider>(context);
      final workouts = provider.workouts;

      return workouts.isEmpty
          ? Center(
        child: Text(
          'No exercises',
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
import 'package:fitnessapp/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitnessapp/workouts.dart';
void main() =>runApp( MyApp());

class MyApp extends StatelessWidget {
  static final String title = "Daily Workout Tracker";

  @override
 Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => WorkoutProvider(),
    child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primarySwatch: Colors.deepOrange,
      scaffoldBackgroundColor: Colors.grey,
    ),
    home: MainPage(),

    ),
  );
}


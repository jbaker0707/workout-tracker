import 'package:flutter/material.dart';
import 'package:fitnessapp/main.dart';
import 'package:fitnessapp/workout_dialog_widget.dart';
import 'package:fitnessapp/workout_list_widget.dart';
import 'completed_workouts_widget.dart';
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final tabs = [
      WorkoutListWidget(),
      CompletedWorkoutsWidget(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
              selectedIndex = index;
            }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new_rounded),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_add_check_rounded),
            label: 'Finished',
          ),
        ],
      ),
      body: tabs[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
            context: context,
            builder: (context) => AddWorkoutDialogWidget(),
        ),
        child: Icon(Icons.add_box_outlined),

      ),
    );
  }


  }

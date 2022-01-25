import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_flutter/views/CuisineListView.dart';
import 'package:recipe_flutter/views/saved_recipes.dart';
import 'package:recipe_flutter/views/video_recipe_widget.dart';

class BottomWidgetContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomWidgetState();
  }
}

class BottomWidgetState extends State<BottomWidgetContainer> {
  final list = [
    CuisineWidget(),
    VideoListContainerWidget.get(),
    SavedRecipeWidget()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Colors.blue,
                label: "Recipes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_call),
                backgroundColor: Colors.blue,
                label: "Videos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                backgroundColor: Colors.blue,
                label: "SavedRecipe"),
          ]),
    ));
  }
}

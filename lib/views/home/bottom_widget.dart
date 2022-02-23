import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';
import 'package:recipe_flutter/repository/services/SearchRecipeService.dart';
import 'package:recipe_flutter/views/cuisine/CuisineListView.dart';
import 'package:recipe_flutter/views/recipe_videos/video_recipe_widget.dart';
import 'package:recipe_flutter/views/saved_recipes/saved_recipes.dart';
import 'package:recipe_flutter/views/settings/settings_view.dart';

class BottomWidgetContainer extends StatefulWidget {
  final RecipeService recipeService;
  final SearchRecipeService searchRecipeService;

  BottomWidgetContainer(this.recipeService, this.searchRecipeService);

  @override
  State<StatefulWidget> createState() {
    final list = [
      CuisineWidget(),
      VideoListContainerWidget.get(searchRecipeService),
      SavedRecipeWidget(recipeService),
      SettingScreen()
    ];
    return BottomWidgetState(list);
  }
}

class BottomWidgetState extends State<BottomWidgetContainer> {
  final List<Widget> list;
  int currentIndex = 0;

  BottomWidgetState(this.list);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Recipes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_call), label: "Videos"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box), label: "SavedRecipe"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
    ));
  }
}

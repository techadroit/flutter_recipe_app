import 'package:recipe_flutter/repository/database/RecipeDatabase.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

class RecipeData {
  late int id;
  late String title;
  late String body;
  late String recipeImageUrl;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      RECIPE_TITLE: title,
      RECIPE_IMAGE_URL: recipeImageUrl,
      RECIPE_BODY: body
    };
    map[RECIPE_ID] = id;
    return map;
  }

  RecipeData();

  RecipeData.fromMap(Map<String, dynamic> map) {
    id = map[RECIPE_ID];
    title = map[RECIPE_TITLE];
    body = map[RECIPE_BODY];
    recipeImageUrl = map[RECIPE_IMAGE_URL];
  }

  RecipeData.fromRecipeItem(RecipeItem recipeItem) {
    id = int.parse(recipeItem.id);
    title = recipeItem.heading;
    recipeImageUrl = recipeItem.imageUrl;
    body = "";
  }
}

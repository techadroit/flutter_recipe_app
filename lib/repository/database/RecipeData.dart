import 'package:recipe_flutter/repository/database/RecipeDatabase.dart';

class RecipeData {
  late int id;
  late String title;
  late String body;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      RECIPE_TITLE: title,
      RECIPE_BODY: body
    };
    if (id != null) {
      map[RECIPE_ID] = id;
    }
    return map;
  }

  RecipeData();

  RecipeData.fromMap(Map<String, dynamic> map) {
    id = map[RECIPE_ID];
    title = map[RECIPE_TITLE];
    body = map[RECIPE_BODY];
  }
  
}


import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

class RecipeListEvent extends AppEvent{
}


class SearchRecipes extends RecipeListEvent {
  String keyword;
  SearchRecipes({this.keyword="chicken"});
}

class SaveRecipes extends RecipeListEvent {
  RecipeItem recipeItem;
  SaveRecipes(this.recipeItem);
}
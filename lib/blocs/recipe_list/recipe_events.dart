
import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

class RecipeListEvent extends AppEvent{
}


class SearchRecipes extends RecipeListEvent {
  String keyword;
  bool isSearch;
  SearchRecipes({this.keyword="chicken",this.isSearch=false});
}

class SaveRecipes extends RecipeListEvent {
  RecipeItem recipeItem;
  SaveRecipes(this.recipeItem);
}
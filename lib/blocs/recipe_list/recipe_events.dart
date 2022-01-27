
import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

class RecipeListEvent extends AppEvent{
}


class SearchRecipes extends RecipeListEvent {
  final String keyword;
  final bool isSearch;
  SearchRecipes({this.keyword="chicken",this.isSearch=false});
}

class SaveRecipes extends RecipeListEvent {
  final RecipeItem recipeItem;
  SaveRecipes(this.recipeItem);
}
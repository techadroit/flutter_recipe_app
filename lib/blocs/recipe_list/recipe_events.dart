
import 'package:recipe_flutter/blocs/main/base_bloc.dart';

class RecipeListEvent extends AppEvent{
}


class SearchRecipes extends RecipeListEvent {
  String keyword;
  SearchRecipes({this.keyword="chicken"});
}
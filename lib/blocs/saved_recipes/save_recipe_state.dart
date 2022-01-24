
import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';


class SaveBlocState extends AppState{}

class SaveInitialState extends SaveBlocState{}

class SavedRecipeLoaded extends SaveBlocState{
  List<RecipeItem> recipeList;
  SavedRecipeLoaded(this.recipeList);
}
import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/views/modal/cuisine_with_recipe.dart';

class CuisineListState extends AppState {
  List<CuisineWithRecipes> recipeList = List.empty(growable: true);

  CuisineListState.initial();

  CuisineListState.copyWithItem(
      CuisineListState state, CuisineWithRecipes item) {
    var currentList = List<CuisineWithRecipes>.empty(growable: true);
    currentList.addAll(state.recipeList);
    currentList.add(item);
    this.recipeList = currentList;
  }

  @override
  List<Object?> get props => [recipeList];
}

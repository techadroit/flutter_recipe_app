import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/views/modal/cuisine_with_recipe.dart';

class CuisineListState extends AppState {
  List<CuisineWithRecipes> recipeList = List.empty(growable: true);

  CuisineListState(this.recipeList);

  CuisineListState.initial();

  CuisineListState copyWith(CuisineWithRecipes item){
    var currentList = List<CuisineWithRecipes>.empty(growable: true);
    currentList.addAll(this.recipeList);
    currentList.add(item);
    return CuisineListState(currentList);
  }

  @override
  List<Object?> get props => [recipeList];
}

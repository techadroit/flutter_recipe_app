

import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/blocs/recipe_list/recipe_events.dart';
import 'package:recipe_flutter/blocs/recipe_list/recipe_state.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/usecase/recipe_search_usecase.dart';

class RecipeListBloc extends BaseBloc<RecipeListEvent, RecipeState> {
  late final RecipeRepository repository;
  int offset = 0;
  late SearchRecipeUsecase recipeUsecase;

  RecipeListBloc(this.repository) : super(RecipeUninitialized());

  @override
  Stream<RecipeState> mapEventToState(RecipeListEvent event) async* {
    if (event is SearchRecipes) {
      yield RecipeLoad(true);
      try {
        var response = await recipeUsecase(Param(event.keyword, 1));
        yield response.fold((l) => RecipeError(), (r) => RecipeLoaded(r));
      } catch (_) {
        yield RecipeError();
      }
    }
  }
}
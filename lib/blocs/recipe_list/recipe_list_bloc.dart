import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/blocs/main/either.dart';
import 'package:recipe_flutter/blocs/recipe_list/recipe_events.dart';
import 'package:recipe_flutter/blocs/recipe_list/recipe_state.dart';
import 'package:recipe_flutter/core/error/failures.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';
import 'package:recipe_flutter/usecase/recipe_search_usecase.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

class RecipeListBloc extends BaseBloc<RecipeListEvent, RecipeState> {
  late final RecipeRepository repository;
  int offset = 0;
  late SearchRecipeUsecase recipeUsecase;
  late RecipeService recipeService;
  List<RecipeItem> recipeList = List.empty(growable: true);

  RecipeListBloc(this.repository, this.recipeService,this.recipeUsecase)
      : super(RecipeUninitialized());

  @override
  Stream<RecipeState> mapEventToState(RecipeListEvent event) async* {
    if (event is SearchRecipes) {
      yield RecipeLoad(true);
      try {
        var response = await recipeUsecase(Param(event.keyword, 1));
        yield onRecipeLoad(response);
      } catch (_) {
        yield RecipeError();
      }
    } else if (event is SaveRecipes) {
      await recipeService.saveAllRecipes([event.recipeItem]);
      onSaveRecipe(event.recipeItem);
    }
  }

  RecipeState onRecipeLoad(Either<Failure, List<RecipeItem>> response) {
    return response.fold((l) => RecipeError(), (r) {
      recipeList = r;
      return RecipeLoaded(r);
    });
  }

  void onSaveRecipe(RecipeItem recipeItem) {
    List<RecipeItem> newList = List.empty(growable: true);
    newList = recipeList;
    for (int i = 0; i < newList.length; i++) {
      var item = newList[i];
      if (item.id == recipeItem.id) {
        newList[i] = recipeItem;
      }
    }
    // return RecipeSaved(newList);
  }
}

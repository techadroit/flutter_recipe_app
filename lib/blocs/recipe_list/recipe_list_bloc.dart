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

  RecipeListBloc(this.repository, this.recipeService, this.recipeUsecase)
      : super(RecipeState.initialState());

  @override
  Stream<RecipeState> mapEventToState(RecipeListEvent event) async* {
    if (event is SearchRecipes) {
      yield RecipeState.loading(true);
      try {
        var response = await getRecipes(event.isSearch, event.keyword);
        yield onRecipeLoad(response);
      } catch (_) {
        yield RecipeState.onError(Error(ServerFailure()));
      }
    } else if (event is SaveRecipes) {
      await recipeService.saveAllRecipes([event.recipeItem]);
      onSaveRecipe(event.recipeItem);
    }
  }

  Future<Either<Failure, List<RecipeItem>>> getRecipes(
      bool isSearch, String keyword) async {
    var param = new ServiceParam(keyword, 1);
    if (isSearch) {
      return await recipeService.searchRecipes(param);
    } else {
      return await recipeService.searchRecipesForCuisine(param);
    }
  }

  RecipeState onRecipeLoad(Either<Failure, List<RecipeItem>> response) {
    return response.fold((l) => RecipeState.onError(Error(ServerFailure())),
        (r) {
      recipeList = r;
      return RecipeState.loaded(r);
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

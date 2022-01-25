import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/blocs/main/either.dart';
import 'package:recipe_flutter/blocs/recipe_list/recipe_events.dart';
import 'package:recipe_flutter/blocs/recipe_list/recipe_state.dart';
import 'package:recipe_flutter/core/error/failures.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';
import 'package:recipe_flutter/repository/services/SearchRecipeService.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

class RecipeListBloc extends BaseBloc<RecipeListEvent, RecipeState> {
  late final RecipeRepository repository;
  int offset = 0;
  late SearchRecipeService recipeService;
  String keyword = "";
  List<RecipeItem> recipeList = List.empty(growable: true);

  RecipeListBloc(this.repository, this.recipeService)
      : super(RecipeState.loading(true));

  @override
  Stream<RecipeState> mapEventToState(RecipeListEvent event) async* {
    if (event is SearchRecipes) {
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
    var param = getParam(keyword);
    if (isSearch) {
      return await recipeService.searchRecipes(param);
    } else {
      return await recipeService.searchRecipesForCuisine(param);
    }
  }

  ServiceParam getParam(String key) {
    if (keyword == key) {
      offset = offset + 1;
    } else {
      offset = 0;
    }
    keyword = key;
    return new ServiceParam(keyword, offset);
  }

  RecipeState onRecipeLoad(Either<Failure, List<RecipeItem>> response) {
    return response.fold((l) => RecipeState.onError(Error(ServerFailure())),
        (r) {
      return onSuccessVideoLoad(r);
    });
  }

  RecipeState onSuccessVideoLoad(List<RecipeItem> newList) {
    final currentState = state;
    if (currentState.results.isNotEmpty) {
      var currentList = currentState.results;
      var resultList = currentList + newList;
      recipeList = resultList;
      return RecipeState.loaded(resultList);
    } else {
      recipeList = newList;
      return RecipeState.loaded(newList);
    }
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

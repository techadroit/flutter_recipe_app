import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/usecase/recipe_search_usecase.dart';
import 'package:recipe_flutter/views/widgetvideorecipe.dart';

import 'actions.dart';
import 'events.dart';

class RecipeListBloc extends Bloc<RecipeEvent, RecipeState> {
  final RecipeRepository repository;
  int offset = 0;
  SearchRecipeUsecase recipeUsecase;
  SearchVideoRecipeUsecase videoRecipeUsecase;

  RecipeListBloc({@required this.repository});

  @override
  RecipeState get initialState => RecipeUninitialized();

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    if (event is SearchRecipes) {
      yield RecipeLoad(isLoading: true);
      try {
        var response = await recipeUsecase(Param(event.keyword, 1));
        yield response.fold((l) => RecipeError(), (r) => RecipeLoaded(r));
      } catch (_) {
        yield RecipeError();
      }
    } else if (event is SearchVideos) {
      yield* loadVideo();
    } else if (event is BottomNavigationEvent) {
      yield BottomNavigationState(event.index);
    }
  }

  Stream<RecipeState> loadVideo() async* {
    final currentState = state;
    if (currentState is! VideoRecipeLoaded) yield RecipeLoad(isLoading: true);
    var response = await videoRecipeUsecase(Param("chicken", offset));
    yield response.fold((l) => RecipeError(), (r) => onSuccessVideoLoad(r));
    offset++;
  }

  VideoRecipeLoaded onSuccessVideoLoad(List<VideoRecipeItem> newList) {
    final currentState = state;
    if (currentState is VideoRecipeLoaded) {
      var currentList = currentState.list;
      var resultList = currentList + newList;
      return VideoRecipeLoaded(resultList);
    } else {
      return VideoRecipeLoaded(newList);
    }
  }
}

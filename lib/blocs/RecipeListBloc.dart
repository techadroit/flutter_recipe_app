import 'package:flutter/cupertino.dart';
import 'package:recipe_flutter/api_response/SearchReicpeResponse.dart';
import 'package:bloc/bloc.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/views/ListWidget.dart';
import 'package:recipe_flutter/views/widgetvideorecipe.dart';

import 'actions.dart';
import 'events.dart';

class RecipeListBloc extends Bloc<RecipeAction, RecipeEvent> {
  final RecipeRepository repository;
  int offset = 0;

  RecipeListBloc({@required this.repository});

  @override
  RecipeEvent get initialState => RecipeUninitialized();

  @override
  Stream<RecipeEvent> mapEventToState(RecipeAction event) async* {
    if (event is SearchRecipes) {
      yield RecipeLoad(isLoading: true);
      try {
        // yield RecipeError();
        SearchRecipeResponse response =
            await repository.searchRecipeFor(event.keyword, 1);
        yield RecipeLoaded(toRecipeItems(response));
      } catch (_) {
        yield RecipeError();
      }
    } else if (event is SearchVideos) {
      yield* loadVideo();
    } else if (event is BottomNavigationAction) {
      yield BottomNavigationEvent(event.index);
    }
  }

  Stream<RecipeEvent> loadVideo() async* {
    final currentState = state;
    if (currentState is! VideoRecipeLoaded) yield RecipeLoad(isLoading: true);

    try {
      VideoListResponse response =
          await repository.loadVidoeRecipes("chicken", offset);
      offset++;

      var newList = toVideoReicpeItems(response);

      if (currentState is VideoRecipeLoaded) {
        var currentList = currentState.list;
        var resultList = currentList + newList;
        yield VideoRecipeLoaded(resultList);
      } else {
        yield VideoRecipeLoaded(newList);
      }
    } catch (_) {
      yield RecipeError();
    }
  }

  List<VideoRecipeItem> toVideoReicpeItems(VideoListResponse response) {
    List<VideoRecipeItem> list = List();
    var result = response.videos;
    for (Video video in result) {
      VideoRecipeItem item = VideoRecipeItem();
      item.title = video.title;
      item.thumbnailurl = video.thumbnail;
      item.youtubeId = video.youTubeId;
      list.add(item);
    }
    return list;
  }

  List<RecipeItem> toRecipeItems(SearchRecipeResponse response) {
    List<Result> list = response.results;
    List<RecipeItem> recipeList = new List<RecipeItem>();
    for (int i = 0; i < list.length; i++) {
      var result = list[i];
      var item = RecipeItem();
      item.id = result.id.toString();
      item.imageUrl = response.baseUri + result.image;
      item.cookingTime = result.readyInMinutes.toString();
      item.serving = result.servings.toString();
      item.heading = result.title;
      recipeList.add(item);
    }
    return recipeList;
  }
}

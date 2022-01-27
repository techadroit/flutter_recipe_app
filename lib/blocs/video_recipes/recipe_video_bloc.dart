import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/blocs/video_recipes/recipe_video_events.dart';
import 'package:recipe_flutter/blocs/video_recipes/recipe_video_state.dart';
import 'package:recipe_flutter/core/error/failures.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';
import 'package:recipe_flutter/repository/services/SearchRecipeService.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

class VideoRecipeBloc extends BaseBloc<RecipeVideoEvent, RecipeVideoState> {
  late final RecipeRepository repository;
  int offset = 0;
  late SearchRecipeService searchRecipeService;

  VideoRecipeBloc(this.searchRecipeService)
      : super(RecipeVideoState.loading(true));

  @override
  Stream<RecipeVideoState> mapEventToState(RecipeVideoEvent event) async* {
    if (event is SearchVideos) {
      yield* loadVideo();
    }
  }

  Stream<RecipeVideoState> loadVideo() async* {
    var response = await searchRecipeService
        .loadVideoRecipesFor(ServiceParam("chicken", offset));
    yield response.fold((l) => RecipeVideoState.onError(Error(ServerFailure())),
        (r) => onSuccessVideoLoad(r));
    offset++;
  }

  RecipeVideoState onSuccessVideoLoad(List<VideoRecipeItem> newList) {
    final currentState = state;
    if (currentState.results.isNotEmpty) {
      var currentList = currentState.results;
      var resultList = currentList + newList;
      return RecipeVideoState.loaded(resultList);
    } else {
      return RecipeVideoState.loaded(newList);
    }
  }
}

import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/blocs/video_recipes/recipe_video_events.dart';
import 'package:recipe_flutter/blocs/video_recipes/recipe_video_state.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/usecase/recipe_search_usecase.dart';
import 'package:recipe_flutter/views/video_recipe_widget.dart';


class VideoRecipeBloc extends BaseBloc<RecipeVideoEvent, RecipeVideoState> {
  late final RecipeRepository repository;
  int offset = 0;
  late SearchVideoRecipeUsecase videoRecipeUsecase;

  VideoRecipeBloc(this.repository) : super(VideoRecipeUninitialized());

  @override
  Stream<RecipeVideoState> mapEventToState(RecipeVideoEvent event) async* {
    if (event is SearchVideos) {
      yield* loadVideo();
    }
  }

  Stream<RecipeVideoState> loadVideo() async* {
    final currentState = state;
    if (currentState is! VideoRecipeLoaded) yield VideoRecipeLoad(true);
    var response = await videoRecipeUsecase(Param("chicken", offset));
    yield response.fold((l) => VideoRecipeError(), (r) => onSuccessVideoLoad(r));
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
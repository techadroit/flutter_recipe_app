// import 'package:bloc/bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:recipe_flutter/blocs/main/base_bloc.dart';
// import 'package:recipe_flutter/repository/RecipeRepository.dart';
// import 'package:recipe_flutter/usecase/recipe_search_usecase.dart';
// import 'package:recipe_flutter/views/video_recipe_widget.dart';
//
// import 'events.dart';
// import 'state.dart';
//
// class RecipeListBloc extends BaseBloc<RecipeEvent, RecipeState> {
//   late final RecipeRepository repository;
//   int offset = 0;
//   late SearchRecipeUsecase recipeUsecase;
//   late SearchVideoRecipeUsecase videoRecipeUsecase;
//
//   RecipeListBloc(this.repository) : super(RecipeUninitialized());
//
//   @override
//   Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
//     if (event is SearchRecipes) {
//       yield RecipeLoad(true);
//       try {
//         var response = await recipeUsecase(Param(event.keyword, 1));
//         yield response.fold((l) => RecipeError(), (r) => RecipeLoaded(r));
//       } catch (_) {
//         yield RecipeError();
//       }
//     } else if (event is SearchVideos) {
//       yield* loadVideo();
//     } else if (event is BottomNavigationEvent) {
//       yield BottomNavigationState(event.index);
//     }
//   }
//
//   Stream<RecipeState> loadVideo() async* {
//     final currentState = state;
//     if (currentState is! VideoRecipeLoaded) yield RecipeLoad(true);
//     var response = await videoRecipeUsecase(Param("chicken", offset));
//     yield response.fold((l) => RecipeError(), (r) => onSuccessVideoLoad(r));
//     offset++;
//   }
//
//   VideoRecipeLoaded onSuccessVideoLoad(List<VideoRecipeItem> newList) {
//     final currentState = state;
//     if (currentState is VideoRecipeLoaded) {
//       var currentList = currentState.list;
//       var resultList = currentList + newList;
//       return VideoRecipeLoaded(resultList);
//     } else {
//       return VideoRecipeLoaded(newList);
//     }
//   }
// }

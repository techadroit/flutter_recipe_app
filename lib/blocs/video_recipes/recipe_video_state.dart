import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/core/error/failures.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

class RecipeVideoState extends AppState {
  List<VideoRecipeItem> results = List.empty();
  Error? error;
  bool? loading;

  RecipeVideoState.initialState();

  RecipeVideoState.loading(this.loading);

  RecipeVideoState.loaded(this.results);

  RecipeVideoState.onError(this.error);

  @override
  List<Object?> get props => [results, error, loading];
}
//
// class VideoRecipeLoaded extends RecipeVideoState {
//   List<VideoRecipeItem> list = List.empty();
//
//   VideoRecipeLoaded(this.list);
//
//   @override
//   List<Object?> get props => list;
// }
//
// class VideoRecipeUninitialized extends RecipeVideoState {}
//
// class VideoRecipeError extends RecipeVideoState {}
//
// class VideoRecipeLoad extends RecipeVideoState {
//   bool isLoading = false;
//
//   VideoRecipeLoad(this.isLoading);
//
//   @override
//   List<Object?> get props => super.props;
// }

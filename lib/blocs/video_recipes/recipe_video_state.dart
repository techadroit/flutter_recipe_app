import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/views/video_recipe_widget.dart';

abstract class RecipeVideoState extends AppState {}

class VideoRecipeLoaded extends RecipeVideoState {
  List<VideoRecipeItem> list = List.empty();

  VideoRecipeLoaded(this.list);

  @override
  List<Object> get props => list;
}

class VideoRecipeUninitialized extends RecipeVideoState {}

class VideoRecipeError extends RecipeVideoState {}

class VideoRecipeLoad extends RecipeVideoState {
  bool isLoading = false;

  VideoRecipeLoad(this.isLoading);

  @override
  List<Object> get props => super.props;
}

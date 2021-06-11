import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

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

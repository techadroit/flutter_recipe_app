
import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/views/list_widget.dart';

abstract class RecipeState extends AppState {
  RecipeState();

}

class RecipeLoaded extends RecipeState {
  List<RecipeItem> results = List.empty();
  RecipeLoaded(this.results);
  @override
  List<Object> get props => results;
}


class RecipeUninitialized extends RecipeState {}

class RecipeError extends RecipeState {}

class RecipeLoad extends RecipeState {
  bool isLoading = false;
  RecipeLoad(this.isLoading);
  @override
  List<Object> get props => super.props;
}
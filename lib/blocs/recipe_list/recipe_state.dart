
import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

abstract class RecipeState extends AppState {
  RecipeState();
}

class RecipeLoaded extends RecipeState {
  List<RecipeItem> results = List.empty();
  RecipeLoaded(this.results);
  @override
  List<Object> get props => results;
}

class RecipeSaved extends RecipeState {
  List<RecipeItem> results = List.empty();
  RecipeSaved(this.results);

  RecipeSaved.onSave(List<RecipeItem> oldList,RecipeItem newItem){
    List<RecipeItem> newList = List.empty(growable: true);
    newList = oldList;
    for (int i = 0; i < newList.length; i++) {
      var item = newList[i];
      if (item.id == newItem.id) {
        newList[i] = newItem;
      }
    }
    results = newList;
  }

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
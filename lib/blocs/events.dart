
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipe_flutter/repository/model/RecipeDetail.dart';

import 'package:recipe_flutter/views/list_widget.dart';
import 'package:recipe_flutter/views/widgetvideorecipe.dart';

class BottomNavigationState extends RecipeState {
  int index = 0;
  BottomNavigationState(this.index);

  @override
  List<Object> get props => [index];
}

class RecipeDetailState extends RecipeState{
  RecipeDetail recipeDetail;
  RecipeDetailState(this.recipeDetail);

  @override
  List<Object> get props => [recipeDetail];
}

abstract class RecipeState extends Equatable {
  RecipeState();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return this.runtimeType.toString();
  }
}

class RecipeLoaded extends RecipeState {
  List<RecipeItem> results = List();
  RecipeLoaded(this.results);
  @override
  List<Object> get props => results;
}

class VideoRecipeLoaded extends RecipeState{
  List<VideoRecipeItem> list = List();
  VideoRecipeLoaded(this.list);

  @override
  List<Object> get props => list;
  
}

class RecipeUninitialized extends RecipeState {}

class RecipeError extends RecipeState {}

class RecipeLoad extends RecipeState {
  bool isLoading = false;
  RecipeLoad({@required this.isLoading});
  @override
  List<Object> get props => super.props;
}


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:recipe_flutter/blocs/RecipeListBloc.dart';
import 'package:recipe_flutter/views/ListWidget.dart';
import 'package:recipe_flutter/views/widgetvideorecipe.dart';

class BottomNavigationEvent extends RecipeEvent {
  int index = 0;
  BottomNavigationEvent(this.index);

  @override
  List<Object> get props => [index];
}

abstract class RecipeEvent extends Equatable {
  RecipeEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return this.runtimeType.toString();
  }
}

class RecipeLoaded extends RecipeEvent {
  List<RecipeItem> results = List();
  RecipeLoaded(this.results);
  @override
  List<Object> get props => results;
}

class VideoRecipeLoaded extends RecipeEvent{
  List<VideoRecipeItem> list = List();
  VideoRecipeLoaded(this.list);

  @override
  List<Object> get props => list;
  
}

class RecipeUninitialized extends RecipeEvent {}

class RecipeError extends RecipeEvent {}

class RecipeLoad extends RecipeEvent {
  bool isLoading = false;
  RecipeLoad({@required this.isLoading});
  @override
  List<Object> get props => super.props;
}

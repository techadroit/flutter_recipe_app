import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/repository/model/Cuisine.dart';

class UserInterestEvent extends AppEvent {}

class LoadAllCuisines extends UserInterestEvent {}

class CuisineSelected extends UserInterestEvent {
  final Cuisine cuisine;

  CuisineSelected(this.cuisine);
}

class SaveSelectedCuisines extends UserInterestEvent {}

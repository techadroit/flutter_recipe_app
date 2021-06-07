
import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/repository/model/RecipeDetail.dart';

abstract class RecipeDetailState extends AppState{}

class RecipeDetailLoaded extends RecipeDetailState{
  RecipeDetail recipeDetail;
  RecipeDetailLoaded(this.recipeDetail);
  @override
  List<Object> get props => [recipeDetail];
}


class RecipeDetailLoading extends RecipeDetailState{

}

class RecipeError extends RecipeDetailState{}

class RecipeInitialState extends RecipeDetailState{}

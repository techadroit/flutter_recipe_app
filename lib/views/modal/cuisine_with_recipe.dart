
import 'package:equatable/equatable.dart';
import 'package:recipe_flutter/repository/model/Cuisine.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

class CuisineWithRecipes extends Equatable{
  late Cuisine cuisine;
  late List<RecipeItem> recipes;
  CuisineWithRecipes(this.cuisine,this.recipes);

  @override
  List<Object?> get props => [cuisine,recipes];
}
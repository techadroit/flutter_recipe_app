
import 'package:recipe_flutter/blocs/main/base_bloc.dart';

abstract class RecipeDetailEvent extends AppEvent{

}


class FetchRecipeDetail extends RecipeDetailEvent{
 String id;
 FetchRecipeDetail(this.id);

 @override
  List<Object?> get props => [id];
}
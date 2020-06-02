import 'package:recipe_flutter/api_response/RecipeDetailResponse.dart';
import 'package:recipe_flutter/repository/model/RecipeDetail.dart';

abstract class DataMapper<T,E>{

  T mapTo(E e);
}

class RecipeDetailMapper extends DataMapper<RecipeDetail,RecipeDetailResponse>{
  
  @override
  mapTo(RecipeDetailResponse e) {
    var recipeDetail = RecipeDetail();
    recipeDetail.dairyFree = e.dairyFree;
    recipeDetail.vegan = e.vegan;
    recipeDetail.glutenFree = e.glutenFree;
    recipeDetail.sourceName = e.sourceName;
    recipeDetail.sourceLink =e.sourceUrl;
    recipeDetail.imageUrl = e.image;
    recipeDetail.description = e.summary;
    recipeDetail.readInMinute = e.readyInMinutes;
    recipeDetail.servings = e.servings;
    recipeDetail.title = e.title;
    recipeDetail.id = e.id;
    recipeDetail.score = e.spoonacularScore;

    e.extendedIngredients.map((e) => 
    recipeDetail.ingredientList.add(RecipeIngredients(e.originalName)));

    e.analyzedInstructions.map((e) =>
    recipeDetail.instructions.add(RecipeInstruction(e.steps.first.step)));

    return recipeDetail;
  }

}
import 'package:recipe_flutter/api_response/recipe_detail_response.dart';
import 'package:recipe_flutter/repository/model/RecipeDetail.dart';

abstract class DataMapper<T,E>{

  T mapTo(E e);
}

class RecipeDetailMapper extends DataMapper<RecipeDetail,RecipeDetailResponse>{
  
  @override
  mapTo(RecipeDetailResponse e) {
    var recipeDetail = RecipeDetail();
    recipeDetail.dairyFree = e.dairyFree!;
    recipeDetail.vegan = e.vegan!;
    recipeDetail.glutenFree = e.glutenFree!;
    recipeDetail.sourceName = e.sourceName!;
    recipeDetail.sourceLink =e.sourceUrl!;
    recipeDetail.imageUrl = e.image!;
    recipeDetail.description = e.summary!;
    recipeDetail.readInMinute = e.readyInMinutes!;
    recipeDetail.servings = e.servings!;
    recipeDetail.title = e.title!;
    recipeDetail.id = e.id!;
    recipeDetail.score = e.spoonacularScore!;

    e.extendedIngredients?.forEach((element) {
      recipeDetail.ingredientList.add(RecipeIngredients(element.originalName!));
    });

//    e.analyzedInstructions.map((a) =>
//    recipeDetail.instructions.add(new RecipeInstruction(a.steps.first.step)));

    return recipeDetail;
  }

}
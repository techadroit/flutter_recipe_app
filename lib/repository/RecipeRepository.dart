import 'package:flutter/cupertino.dart';
import 'package:recipe_flutter/api_response/AutoCompleteResponse.dart';
import 'package:recipe_flutter/api_response/RecipeDetailResponse.dart';
import 'package:recipe_flutter/api_response/SearchReicpeResponse.dart';
import 'package:recipe_flutter/repository/mapper/DataMapper.dart';
import 'package:recipe_flutter/repository/network/RecipeApiClient.dart';

class RecipeRepository {
  RecipeApiClient recipeApiClient;
  RecipeRepository({@required this.recipeApiClient});

  Future<SearchRecipeResponse> searchRecipeFor(
      String query, int offset) async {
    return recipeApiClient.getSearchApi(query, offset, "10");
  }

  Future<List<AutoCompleteResponse>> autoComplete(String query){
    return recipeApiClient.autoComplete(query,10);
  }

  Future<RecipeDetailResponse> getRecipeDetail(String id,DataMapper mapper){
    try{
    var response  =  recipeApiClient.getRecipeDetailForId(id);
    // if(mapper != null)
    //   return mapper.mapTo(response);
    //   else
      return response;
    }  catch(e){
      print(e);
    }
  }



  Future<VideoListResponse> loadVidoeRecipes(
      String query, int offset) async {
    return recipeApiClient.loadVideoFor(query, offset, "10");
  }

}

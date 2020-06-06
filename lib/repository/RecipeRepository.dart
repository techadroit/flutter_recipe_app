import 'package:flutter/cupertino.dart';
import 'package:recipe_flutter/api_response/AutoCompleteResponse.dart';
import 'package:recipe_flutter/api_response/RecipeDetailResponse.dart';
import 'package:recipe_flutter/api_response/SearchReicpeResponse.dart';
import 'package:recipe_flutter/repository/mapper/DataMapper.dart';
import 'package:recipe_flutter/repository/network/RecipeApiClient.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';

class RecipeRepository {
  RemoteDataSource dataSource;
  RecipeRepository({@required this.dataSource});

  Future<SearchRecipeResponse> searchRecipeFor(
      String query, int offset) async {
    return dataSource.getRecipes(query, offset, "10");
  }

  Future<List<AutoCompleteResponse>> autoComplete(String query){
    return dataSource.autoComplete(query,10);
  }

  Future<RecipeDetailResponse> getRecipeDetail(String id,DataMapper mapper){
    try{
    var response  =  dataSource.getRecipeDetailForId(id);
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
    return dataSource.loadVideoFor(query, offset, "10");
  }

}

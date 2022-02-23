import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe_flutter/api_response/auto_complete_response.dart';
import 'package:recipe_flutter/api_response/recipe_detail_response.dart';
import 'package:recipe_flutter/api_response/search_recipe_response.dart';
import 'package:recipe_flutter/api_response/search_video_recipes_response.dart';

/// TODO : null handling
class RecipeApiClient {
  static const baseurl = 'https://api.spoonacular.com';
  static const imageBaseurl = 'https://spoonacular.com/recipeImages/';
  static const apikey = '95aed809c8d84dd6b831b9aaa35c5f24';
  final http.Client httpClient;

  RecipeApiClient(this.httpClient);

  Future<SearchRecipeResponse> getSearchApi(
      String query, int offset, String number) async {
    String url =
        '$baseurl/recipes/search?apiKey=$apikey&query=$query&offset=$offset&number=$number';

    final recipeResponse = await this.httpClient.get(Uri.parse(url)).timeout(new Duration(seconds: 20));

    if (recipeResponse.statusCode != 200)
      throw new Exception(recipeResponse.body);

    final recipeJson = jsonDecode(recipeResponse.body);
    return SearchRecipeResponse.fromJson(recipeJson);
  }

  Future<List<AutoCompleteResponse>> autoComplete(String query,int number) async{
    String url =
        '$baseurl/recipes/autocomplete?apiKey=$apikey&query=$query&number=$number';
    final recipeResponse = await this.httpClient.get(Uri.parse(url));

    if (recipeResponse.statusCode != 200)
      throw new Exception(recipeResponse.body);

    final recipeJson = jsonDecode(recipeResponse.body) as List;
    return recipeJson.map((e) => AutoCompleteResponse.fromJson(e)).toList();
  }

  Future<RecipeDetailResponse> getRecipeDetailForId(String id) async{
    String url =
        '$baseurl/recipes/$id/information?apiKey=$apikey';
    final recipeDetailResponse = await this.httpClient.get(Uri.parse(url));
    if(recipeDetailResponse.statusCode != 200)
    throw new Exception(recipeDetailResponse.body);
    
    final recipeDetail = jsonDecode(recipeDetailResponse.body);
    return RecipeDetailResponse.fromJson(recipeDetail);
  }
  
  Future<SearchVideoRecipesResponse> loadVideoFor(
      String query, int offset, String number) async {
    String url =
        '$baseurl/food/videos/search?apiKey=$apikey&query=$query&offset=$offset&number=$number';
    final recipeResponse = await this.httpClient.get(Uri.parse(url));

    if (recipeResponse.statusCode != 200)
      throw new Exception(recipeResponse.body);

    final recipeJson = jsonDecode(recipeResponse.body);
    return SearchVideoRecipesResponse.fromJson(recipeJson);
  }
}

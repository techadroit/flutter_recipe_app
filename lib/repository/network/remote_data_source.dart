import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:recipe_flutter/api_response/auto_complete_response.dart';
import 'package:recipe_flutter/api_response/recipe_detail_response.dart';
import 'package:recipe_flutter/api_response/search_recipe_response.dart';
import 'package:recipe_flutter/api_response/search_video_recipes_response.dart';
import 'package:recipe_flutter/core/error/exceptions.dart';

/// TODO : handle null response for jsondecode
class RemoteDataSource {
  static const apikey = '95aed809c8d84dd6b831b9aaa35c5f24';
  Dio dio;

  RemoteDataSource(this.dio);

  Future<SearchRecipeResponse> getRecipes(
      String query, int offset, String number) async {
    String url =
        '/recipes/search?apiKey=$apikey&query=$query&offset=$offset&number=$number';
    Response<String> recipeResponse = await dio.get(url);
    if (recipeResponse.statusCode != 200) throw ServerException();
      return SearchRecipeResponse.fromJson(processJson(recipeResponse));
  }

  Future<SearchRecipeResponse> getRecipesForCuisine(
      String cuisine, int offset, String number) async {
    String url =
        '/recipes/complexSearch?apiKey=$apikey&cuisine=$cuisine&offset=$offset&number=$number';
    Response<String> recipeResponse = await dio.get(url);
    if (recipeResponse.statusCode != 200) throw ServerException();
      return SearchRecipeResponse.fromJson(processJson(recipeResponse));
  }

  Future<List<AutoCompleteResponse>> autoComplete(
      String query, int number) async {
    String url =
        '/recipes/autocomplete?apiKey=$apikey&query=$query&number=$number';
    Response<String> recipeResponse = await dio.get(url);
    final res = recipeResponse.data;
    if (recipeResponse.statusCode != 200 && res == null)
      throw ServerException();
      final recipeJson = processJson(recipeResponse) as List;
      return recipeJson.map((e) => AutoCompleteResponse.fromJson(e)).toList();
  }

  Future<RecipeDetailResponse> getRecipeDetailForId(String id) async {
    String url = '/recipes/$id/information?apiKey=$apikey';
    Response<String> recipeDetailResponse = await dio.get(url);
    if (recipeDetailResponse.statusCode != 200) throw ServerException();
    final recipeDetailJson = processJson(recipeDetailResponse);
    return RecipeDetailResponse.fromJson(recipeDetailJson);
  }

  Future<SearchVideoRecipesResponse> loadVideoFor(
      String query, int offset, String number) async {
    String url =
        '/food/videos/search?apiKey=$apikey&query=$query&offset=$offset&number=$number';
    Response<String> recipeResponse = await dio.get(url);
    if (recipeResponse.statusCode != 200) throw ServerException();
    return SearchVideoRecipesResponse.fromJson(processJson(recipeResponse));
  }

  dynamic processJson(Response<String> response) {
    final responseBody = response.data;
    if (responseBody != null) {
      return jsonDecode(responseBody);
    } else {
      throw ServerException();
    }
  }
}

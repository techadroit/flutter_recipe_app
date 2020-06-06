import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:recipe_flutter/api_response/AutoCompleteResponse.dart';
import 'package:recipe_flutter/api_response/RecipeDetailResponse.dart';
import 'package:recipe_flutter/api_response/SearchReicpeResponse.dart';
import 'package:recipe_flutter/core/error/exceptions.dart';

class RemoteDataSource {
  static const apikey = '';
  Dio dio;

  RemoteDataSource(this.dio);

  Future<SearchRecipeResponse> getRecipes(
      String query, int offset, String number) async {
    String url =
        '/recipes/search?apiKey=$apikey&query=$query&offset=$offset&number=$number';
    Response<String> recipeResponse =
        await dio.get(url);
    if (recipeResponse.statusCode != 200) throw ServerException();
    final recipeJson = jsonDecode(recipeResponse.data);
    return SearchRecipeResponse.fromJson(recipeJson);
  }

  Future<List<AutoCompleteResponse>> autoComplete(
      String query, int number) async {
    String url =
        '/recipes/autocomplete?apiKey=$apikey&query=$query&number=$number';
    Response<String> recipeResponse = await dio.get(url);
    if (recipeResponse.statusCode != 200) throw ServerException();
    final recipeJson = jsonDecode(recipeResponse.data) as List;
    return recipeJson.map((e) => AutoCompleteResponse.fromJson(e)).toList();
  }

  Future<RecipeDetailResponse> getRecipeDetailForId(String id) async {
    String url = '/recipes/$id/information?apiKey=$apikey';
    Response<String> recipeDetailResponse = await dio.get(url);
    if (recipeDetailResponse.statusCode != 200) throw ServerException();
    final recipeDetail = jsonDecode(recipeDetailResponse.data);
    return RecipeDetailResponse.fromJson(recipeDetail);
  }

  Future<VideoListResponse> loadVideoFor(
      String query, int offset, String number) async {
    String url =
        '/food/videos/search?apiKey=$apikey&query=$query&offset=$offset&number=$number';
    Response<String> recipeResponse = await dio.get(url);
    if (recipeResponse.statusCode != 200) throw ServerException();
    final recipeJson = jsonDecode(recipeResponse.data);
    return VideoListResponse.fromJson(recipeJson);
  }
}

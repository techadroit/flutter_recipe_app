import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_flutter/api_response/SearchReicpeResponse.dart';

class RecipeApiClient {
  static const basedurl = 'https://api.spoonacular.com';
  static const apikey = '95aed809c8d84dd6b831b9aaa35c5f24';
  final http.Client httpClient;

  RecipeApiClient({@required this.httpClient});

  Future<SearchRecipeResponse> getSearchApi(
      String query, int offset, String number) async {
    String url =
        '$basedurl/recipes/search?apiKey=$apikey&query=$query&offset=$offset&number=$number';
    final recipeResponse = await this.httpClient.get(url);

    if (recipeResponse.statusCode != 200)
      throw new Exception(recipeResponse.body);

    final recipeJson = jsonDecode(recipeResponse.body);
    return SearchRecipeResponse.fromJson(recipeJson);
  }
  
  Future<VideoListResponse> loadVideoFor(
      String query, int offset, String number) async {
    String url =
        '$basedurl/food/videos/search?apiKey=$apikey&query=$query&offset=$offset&number=$number';
    final recipeResponse = await this.httpClient.get(url);

    if (recipeResponse.statusCode != 200)
      throw new Exception(recipeResponse.body);

    final recipeJson = jsonDecode(recipeResponse.body);
    return VideoListResponse.fromJson(recipeJson);
  }
}

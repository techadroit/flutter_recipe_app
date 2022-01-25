import 'package:recipe_flutter/api_response/auto_complete_response.dart';
import 'package:recipe_flutter/api_response/recipe_detail_response.dart';
import 'package:recipe_flutter/api_response/search_recipe_response.dart';
import 'package:recipe_flutter/api_response/search_video_recipes_response.dart';
import 'package:recipe_flutter/repository/mapper/DataMapper.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';

class RecipeRepository {
  late RemoteDataSource dataSource;

  RecipeRepository(this.dataSource);

  Future<SearchRecipeResponse> searchRecipeFor(String query, int offset) async {
    return dataSource.getRecipes(query, offset, "10");
  }

  Future<SearchRecipeResponse> searchRecipeForCuisine(
      String cuisine, int offset) async {
    return dataSource.getRecipesForCuisine(cuisine, offset, "10");
  }

  Future<List<AutoCompleteResponse>> autoComplete(String query) {
    return dataSource.autoComplete(query, 10);
  }

  Future<RecipeDetailResponse>? getRecipeDetail(String id, DataMapper mapper) {
    try {
      var response = dataSource.getRecipeDetailForId(id);
      return response;
    } catch (e) {
      print(e);
    }
  }

  Future<RecipeDetailResponse> getRecipeInformation(String id) async {
    var response = await dataSource.getRecipeDetailForId(id);
    return response;
  }

  Future<SearchVideoRecipesResponse> loadVidoeRecipes(
      String query, int offset) async {
    return dataSource.loadVideoFor(query, offset, "10");
  }

  Future<List<String>> fetchCuisines() async {
    return [
      "American",
      "British",
      "Chinese",
      "European",
      "French",
      "Indian",
      "Italian",
      "Irish",
      "Japanese",
      "Mediterranean",
      "Spanish",
      "Thai"
    ];
  }
}

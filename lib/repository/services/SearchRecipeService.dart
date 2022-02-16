import 'package:flutter/cupertino.dart';
import 'package:recipe_flutter/api_response/auto_complete_response.dart';
import 'package:recipe_flutter/api_response/search_recipe_response.dart';
import 'package:recipe_flutter/api_response/search_video_recipes_response.dart';
import 'package:recipe_flutter/blocs/main/either.dart';
import 'package:recipe_flutter/core/error/failures.dart';
import 'package:recipe_flutter/repository/LocalRepository.dart';
import 'package:recipe_flutter/repository/network/RecipeApiClient.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

import '../RecipeRepository.dart';
import 'RecipeService.dart';

class SearchRecipeService extends RecipeService {
  SearchRecipeService(
      LocalRepository localRepository, RecipeRepository recipeRepository)
      : super(localRepository, recipeRepository);

  Future<Either<Failure, List<RecipeItem>>> searchRecipes(
      ServiceParam params) async {
    try {
      var response =
          await recipeRepository.searchRecipeFor(params.keyword, params.offset);
      var responseItem =
          toRecipeItemsWithSource(response, RecipeApiClient.imageBaseurl);
      if (responseItem.isEmpty) {
        return Left(NoResultFound());
      } else {
        return Right(responseItem);
      }
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<RecipeItem>>> searchRecipesForCuisine(
      ServiceParam params) async {
    try {
      var response = await recipeRepository.searchRecipeForCuisine(
          params.keyword, params.offset);
      var responseItem = toRecipeItems(response);
      if (responseItem.isEmpty) {
        return Left(NoResultFound());
      } else {
        return Right(responseItem);
      }
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<VideoRecipeItem>>> loadVideoRecipesFor(
      ServiceParam params) async {
    try {
      var response = await recipeRepository.loadVidoeRecipes(
          params.keyword, params.offset);
      var responseItem = toVideoRecipeItems(response);
      return Right(responseItem);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, List<AutoCompleteResponse>>> autoCompleteFor(String params) async {
    try {
      var response = await recipeRepository.autoComplete(params);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  List<VideoRecipeItem> toVideoRecipeItems(
      SearchVideoRecipesResponse response) {
    List<VideoRecipeItem> list = [];
    var result = response.videos;
    for (Videos video in result!) {
      VideoRecipeItem item =
          VideoRecipeItem(video.title!, video.thumbnail!, video.youTubeId!);
      list.add(item);
    }
    return list;
  }

  List<RecipeItem> toRecipeItemsWithSource(
      SearchRecipeResponse response, String sourceUrl) {
    List<Results> list = response.results!;
    List<RecipeItem> recipeList = <RecipeItem>[];
    for (int i = 0; i < list.length; i++) {
      var result = list[i];
      var item = RecipeItem(
          result.id.toString(),
          result.title ?? "",
          result.servings.toString(),
          result.readyInMinutes.toString(),
          (sourceUrl + result.image!),
          false);
      recipeList.add(item);
    }
    return recipeList;
  }
}

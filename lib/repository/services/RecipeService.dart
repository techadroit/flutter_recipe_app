import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:recipe_flutter/api_response/search_recipe_response.dart';
import 'package:recipe_flutter/blocs/main/either.dart';
import 'package:recipe_flutter/core/error/failures.dart';
import 'package:recipe_flutter/repository/LocalRepository.dart';
import 'package:recipe_flutter/repository/database/CuisineData.dart';
import 'package:recipe_flutter/repository/database/RecipeData.dart';
import 'package:recipe_flutter/repository/model/Cuisine.dart';
import 'package:recipe_flutter/repository/network/RecipeApiClient.dart';
import 'package:recipe_flutter/views/modal/cuisine_with_recipe.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

import '../RecipeRepository.dart';

class RecipeService {
  LocalRepository localRepository;
  RecipeRepository recipeRepository;

  RecipeService(this.localRepository, this.recipeRepository);

  Future<void> saveAllRecipes(List<RecipeItem> list) async {
    var newList = list.map((e) => RecipeData.fromRecipeItem(e)).toList();
    await localRepository.saveRecipe(newList);
  }

  Future<List<RecipeItem>> getAllSavedRecipes() async {
    var recipeList = await localRepository.getAllRecipes();
    return toRecipeItemsFromRecipeData(recipeList);
  }

  Future<void> saveAllCuisines(List<Cuisine> list) async {
    var newList = list.map((e) => CuisineData.fromCuisine(e.cuisine)).toList();
    await localRepository.saveCuisines(newList);
  }

  Future<List<Cuisine>> getAllCuisines() async {
    return await localRepository.getSelectedCuisines();
  }

  Stream<CuisineWithRecipes> loadRecipesWithCuisine() async* {
    var cuisineList = await localRepository.getSelectedCuisines();
    for (var element in cuisineList) {
      var searchRecipes =
          await recipeRepository.searchRecipeForCuisine(element.cuisine, 0);
      var recipesList = toRecipeItems(searchRecipes);
      yield CuisineWithRecipes(element, recipesList);
    }
  }

  List<RecipeItem> toRecipeItems(SearchRecipeResponse response,
      ) {
    List<Results> list = response.results!;
    List<RecipeItem> recipeList = <RecipeItem>[];
    for (int i = 0; i < list.length; i++) {
      var result = list[i];
      var item = RecipeItem(
          result.id.toString(),
          result.title ?? "",
          result.servings.toString(),
          result.readyInMinutes.toString(),
          result.image ?? "",
          false);
      recipeList.add(item);
    }
    return recipeList;
  }

  List<RecipeItem> toRecipeItemsWithSource(SearchRecipeResponse response, String sourceUrl) {
    List<Results> list = response.results!;
    List<RecipeItem> recipeList = <RecipeItem>[];
    for (int i = 0; i < list.length; i++) {
      var result = list[i];
      var item = RecipeItem(
          result.id.toString(),
          result.title ?? "",
          result.servings.toString(),
          result.readyInMinutes.toString(),
          (sourceUrl + result.image!) ?? "",
          false);
      recipeList.add(item);
    }
    return recipeList;
  }

  List<RecipeItem> toRecipeItemsFromRecipeData(List<RecipeData> list) {
    List<RecipeItem> recipeList = <RecipeItem>[];
    for (int i = 0; i < list.length; i++) {
      var result = list[i];
      var item = RecipeItem(result.id.toString(), result.title ?? "", "", "",
          result.recipeImageUrl ?? "", false);
      recipeList.add(item);
    }
    return recipeList;
  }

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
}

class ServiceParam extends Equatable {
  String keyword;
  int offset;
  int number = 10;

  ServiceParam(this.keyword, this.offset, {this.number = 10});

  @override
  List<Object?> get props => [keyword, offset, number];
}

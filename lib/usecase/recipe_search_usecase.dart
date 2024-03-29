import 'package:equatable/equatable.dart';
import 'package:recipe_flutter/api_response/search_recipe_response.dart';
import 'package:recipe_flutter/api_response/search_video_recipes_response.dart';
import 'package:recipe_flutter/blocs/main/either.dart';
import 'package:recipe_flutter/core/error/failures.dart';
import 'package:recipe_flutter/core/usecase/usecase.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/model/Cuisine.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';

class SearchRecipeUsecase extends EitherUseCase<List<RecipeItem>, Param> {
  RecipeRepository repository;

  SearchRecipeUsecase(this.repository);

  @override
  Future<Either<Failure, List<RecipeItem>>> call(Param params) async {
    try {
      var response =
          await repository.searchRecipeForCuisine(params.keyword, params.offset);
      var responseItem = toRecipeItems(response);
      return Right(responseItem);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

class SearchVideoRecipeUsecase
    extends EitherUseCase<List<VideoRecipeItem>, Param> {
  RecipeRepository repository;

  SearchVideoRecipeUsecase(this.repository);

  @override
  Future<Either<Failure, List<VideoRecipeItem>>> call(Param params) async {
    try {
      var response =
          await repository.loadVidoeRecipes(params.keyword, params.offset);
      var responseItem = toVideoReicpeItems(response);
      return Right(responseItem);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  List<VideoRecipeItem> toVideoReicpeItems(
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
}

class FetchAllCuisines extends EitherUseCase<List<Cuisine>,NoParams>{
  RecipeRepository recipeRepository;
  FetchAllCuisines(this.recipeRepository);
  @override
  Future<Either<Failure, List<Cuisine>>> call(NoParams params) async {
    try {
      var response =
          await recipeRepository.fetchCuisines();
      return Right(response.map((e) => Cuisine(e)).toList());
    } catch (e) {
      return Left(ServerFailure());
    }
  }

}

List<RecipeItem> toRecipeItemsV1(SearchRecipeResponse response) {
  List<Results> list = response.results!;
  List<RecipeItem> recipeList = <RecipeItem>[];
  for (int i = 0; i < list.length; i++) {
    var result = list[i];
    var item = RecipeItem(
        result.id.toString(),
        result.title!,
        result.servings.toString(),
        result.readyInMinutes.toString(),
        response.baseUri! + result.image!,
        false);
    recipeList.add(item);
  }
  return recipeList;
}

List<RecipeItem> toRecipeItems(SearchRecipeResponse response) {
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

class Param extends Equatable {
  final String keyword;
  final int offset;
  int number = 10;

  Param(this.keyword, this.offset, {this.number = 10});

  @override
  List<Object?> get props => [keyword, offset, number];
}

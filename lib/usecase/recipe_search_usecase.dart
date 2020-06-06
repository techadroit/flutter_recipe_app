
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_flutter/api_response/SearchReicpeResponse.dart';
import 'package:recipe_flutter/core/error/failures.dart';
import 'package:recipe_flutter/core/usecase/usecase.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/views/ListWidget.dart';
import 'package:recipe_flutter/views/widgetvideorecipe.dart';

class SearchRecipeUsecase extends EitherUseCase<List<RecipeItem>,Param>{
  RecipeRepository repository;
  SearchRecipeUsecase(this.repository);

  @override
  Future<Either<Failure, List<RecipeItem>>> call(Param params) async{
    try{
      var response = await repository.searchRecipeFor(params.keyword, params.offset);
      var responseItem = toRecipeItems(response);
      return Right(responseItem);
    }catch(e){
      return Left(ServerFailure());
    }
  }

}

class SearchVideoRecipeUsecase extends EitherUseCase<List<VideoRecipeItem>,Param>{
  RecipeRepository repository;
  SearchVideoRecipeUsecase(this.repository);

  @override
  Future<Either<Failure, List<VideoRecipeItem>>> call(Param params) async{
    try{
      var response = await repository.loadVidoeRecipes(params.keyword, params.offset);
      var responseItem = toVideoReicpeItems(response);
      return Right(responseItem);
    }catch(e){
      return Left(ServerFailure());
    }
  }

  List<VideoRecipeItem> toVideoReicpeItems(VideoListResponse response) {
    List<VideoRecipeItem> list = List();
    var result = response.videos;
    for (Video video in result) {
      VideoRecipeItem item = VideoRecipeItem();
      item.title = video.title;
      item.thumbnailurl = video.thumbnail;
      item.youtubeId = video.youTubeId;
      list.add(item);
    }
    return list;
  }

}

List<RecipeItem> toRecipeItems(SearchRecipeResponse response) {
  List<Result> list = response.results;
  List<RecipeItem> recipeList = new List<RecipeItem>();
  for (int i = 0; i < list.length; i++) {
    var result = list[i];
    var item = RecipeItem();
    item.id = result.id.toString();
    item.imageUrl = response.baseUri + result.image;
    item.cookingTime = result.readyInMinutes.toString();
    item.serving = result.servings.toString();
    item.heading = result.title;
    recipeList.add(item);
  }
  return recipeList;
}

class Param extends Equatable{
  String keyword;
  int offset;
  int number = 10;
  Param(this.keyword,this.offset,{this.number = 10});
  @override
  // TODO: implement props
  List<Object> get props => [keyword,offset,number];
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/api_response/RecipeDetailResponse.dart';
import 'package:recipe_flutter/blocs/actions.dart';
import 'package:recipe_flutter/blocs/events.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/mapper/DataMapper.dart';
import 'package:recipe_flutter/repository/model/RecipeDetail.dart';
import 'package:recipe_flutter/usecase/recipe_detail_usecase.dart';

class RecipeDetailBloc extends Bloc<RecipeAction,RecipeEvent>{

  RecipeRepository remoteRespository;
  FetchRecipeDetailUsecase fetchRecipeDetailUsecase;

  RecipeDetailBloc(this.remoteRespository);

  @override
  RecipeEvent get initialState => RecipeUninitialized();

  @override
  Stream<RecipeEvent> mapEventToState(RecipeAction event) async*{
    yield RecipeLoad(isLoading: true);
    if(event is FetchRecipeDetail){
      var response = await fetchRecipeDetailUsecase(event.id);
      yield response.fold((l) => RecipeError(), (r) => RecipeDetailState(r));
//      RecipeDetailResponse response =
//      await remoteRespository.getRecipeDetail(event.id, RecipeDetailMapper());
//       RecipeDetail recipeDetail = RecipeDetailMapper().mapTo(response);
//      yield RecipeDetailState(recipeDetail);
    }
  }

}
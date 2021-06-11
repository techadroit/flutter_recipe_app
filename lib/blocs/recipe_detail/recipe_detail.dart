
import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/blocs/recipe_detail/recipe_detail_event.dart';
import 'package:recipe_flutter/blocs/recipe_detail/recipe_detail_state.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/usecase/recipe_detail_usecase.dart';

class RecipeDetailBloc extends BaseBloc<RecipeDetailEvent,RecipeDetailState>{

  late RecipeRepository remoteRespository;
  late FetchRecipeDetailUsecase fetchRecipeDetailUsecase;

  RecipeDetailBloc(this.remoteRespository) : super(RecipeInitialState());

  @override
  Stream<RecipeDetailState> mapEventToState(RecipeDetailEvent event) async*{
    yield RecipeDetailLoading();
    if(event is FetchRecipeDetail){
      var response = await fetchRecipeDetailUsecase(event.id);
      yield response.fold((l) => RecipeError(), (r) => RecipeDetailLoaded(r));
    }
  }

}
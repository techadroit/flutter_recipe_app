import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/blocs/recipe_detail/recipe_detail_event.dart';
import 'package:recipe_flutter/blocs/recipe_detail/recipe_detail_state.dart';
import 'package:recipe_flutter/repository/mapper/DataMapper.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';

class RecipeDetailBloc extends BaseBloc<RecipeDetailEvent, RecipeDetailState> {
  final RecipeService recipeService;

  RecipeDetailBloc(this.recipeService) : super(RecipeInitialState());

  @override
  Stream<RecipeDetailState> mapEventToState(RecipeDetailEvent event) async* {
    yield RecipeDetailLoading();
    if (event is FetchRecipeDetail) {
      var response =
          await recipeService.getRecipeDetail(event.id, RecipeDetailMapper());
      yield response.fold((l) => RecipeError(), (r) => RecipeDetailLoaded(r));
    }
  }
}

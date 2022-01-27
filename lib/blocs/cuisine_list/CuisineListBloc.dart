import 'dart:async';

import 'package:recipe_flutter/blocs/cuisine_list/CuisineListEvent.dart';
import 'package:recipe_flutter/blocs/cuisine_list/CuisineListState.dart';
import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';

class CuisineListBloc extends BaseBloc<CuisineListEvent, CuisineListState> {
  late RecipeService recipeService;
  late StreamSubscription recipeSubscription;

  CuisineListBloc(this.recipeService) : super(CuisineListState.initial());

  @override
  Stream<CuisineListState> mapEventToState(CuisineListEvent event) async* {
    if (event is LoadAllCuisines) {
      var stream = recipeService.loadRecipesWithCuisine();
      await for (final value in stream){
        yield state.copyWith(value);
      }
    }
  }

  @override
  Future<void> close() {
    recipeSubscription.cancel();
    return super.close();
  }
}

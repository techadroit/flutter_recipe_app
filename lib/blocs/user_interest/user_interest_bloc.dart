import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/blocs/user_interest/user_interest_event.dart';
import 'package:recipe_flutter/blocs/user_interest/user_interest_state.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';

class UserInterestBloc extends BaseBloc<UserInterestEvent, UserInterestState> {
  final RecipeService recipeService;

  UserInterestBloc(this.recipeService) : super(UserInterestState.initial());

  @override
  Stream<UserInterestState> mapEventToState(UserInterestEvent event) async* {
    if (event is LoadAllCuisines) {
      var response = await recipeService.fetchAllCuisine();
      yield response.fold((l) => UserInterestState.error(),
          (r) => UserInterestState.primary(r));
    } else if (event is CuisineSelected) {
      var newState =
          UserInterestState.selected(event.cuisine, state.allCuisines);
      yield newState;
    } else if (event is SaveSelectedCuisines) {
      var cuisineList =
          state.allCuisines.where((element) => element.isSelected).toList();
      await recipeService.saveAllCuisines(cuisineList);
      yield UserInterestState.cuisineSaved();
    }
  }
}

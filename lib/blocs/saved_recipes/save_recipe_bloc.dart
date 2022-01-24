import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/blocs/saved_recipes/save_recipe_events.dart';
import 'package:recipe_flutter/blocs/saved_recipes/save_recipe_state.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';

class SaveRecipeBloc extends BaseBloc<SaveBlocEvent, SaveBlocState> {
  RecipeService recipeService;

  SaveRecipeBloc(this.recipeService) : super(SaveInitialState());

  @override
  Stream<SaveBlocState> mapEventToState(SaveBlocEvent event) async* {
    if(event is LoadSavedRecipes) {
      var data = await recipeService.getAllSavedRecipes();
      yield SavedRecipeLoaded(data);
    }
  }
}

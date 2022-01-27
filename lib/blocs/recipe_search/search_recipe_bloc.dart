import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/blocs/recipe_search/search_recipe_events.dart';
import 'package:recipe_flutter/blocs/recipe_search/search_recipe_state.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';
import 'package:recipe_flutter/repository/services/SearchRecipeService.dart';
import 'package:recipe_flutter/usecase/autocomplete_usecase.dart';

class SearchBlocs extends BaseBloc<SearchEvent, SearchRecipeState> {
  SearchRecipeService recipeService;

  SearchBlocs(this.recipeService) : super(SearchInitialState());

  @override
  Stream<SearchRecipeState> mapEventToState(SearchEvent event) async* {
    var response = await recipeService.autoCompleteFor(event.keyword);
    yield response.fold((l) => SearchError(), (r) => SearchCompleteState(r));
  }
}

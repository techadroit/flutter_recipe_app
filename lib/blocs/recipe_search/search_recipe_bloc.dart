
import 'package:recipe_flutter/api_response/auto_complete_response.dart';
import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/blocs/recipe_search/search_recipe_events.dart';
import 'package:recipe_flutter/blocs/recipe_search/search_recipe_state.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/usecase/autocomplete_usecase.dart';

class SearchBlocs extends BaseBloc<SearchEvent, SearchRecipeState> {
  late RecipeRepository recipeRepository;
  late AutocompleteUsecase usecase;

  SearchBlocs(this.recipeRepository) : super(SearchInitialState());

  @override
  Stream<SearchRecipeState> mapEventToState(SearchEvent event) async* {
    var response = await usecase(event.keyword);
    yield response.fold((l) => SearchError(), (r) => SearchCompleteState(r));
  }
}
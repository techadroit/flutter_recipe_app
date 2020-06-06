import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/api_response/AutoCompleteResponse.dart';
import 'package:recipe_flutter/blocs/actions.dart';
import 'package:recipe_flutter/blocs/events.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/usecase/autocomplete_usecase.dart';

class SearchBlocs extends Bloc<SearchEvent, RecipeState> {
  RecipeRepository recipeRepository;
  AutocompleteUsecase usecase;

  SearchBlocs(this.recipeRepository);

  @override
  SearchState get initialState => new SearchState(List<AutoCompleteResponse>());

  @override
  Stream<RecipeState> mapEventToState(SearchEvent event) async* {
    var response = await usecase(event.keyword);
    yield response.fold((l) => SearchError(), (r) => SearchState(r));
  }
}

class SearchEvent extends RecipeEvent {
  String keyword;

  SearchEvent(this.keyword);
}

class SearchError extends RecipeState {
  SearchError();

  @override
  List<Object> get props => super.props;
}

class SearchState extends RecipeState {
  final List<AutoCompleteResponse> list;

  SearchState(this.list);

  @override
  List<Object> get props => list;
}

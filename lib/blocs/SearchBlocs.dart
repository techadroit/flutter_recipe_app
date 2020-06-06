import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/api_response/AutoCompleteResponse.dart';
import 'package:recipe_flutter/blocs/actions.dart';
import 'package:recipe_flutter/blocs/events.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/usecase/autocomplete_usecase.dart';

class SearchBlocs extends Bloc<SearchAction, RecipeEvent> {
  RecipeRepository recipeRepository;
  AutocompleteUsecase usecase;

  SearchBlocs(this.recipeRepository);

  @override
  SearchEvent get initialState => new SearchEvent(List<AutoCompleteResponse>());

  @override
  Stream<RecipeEvent> mapEventToState(SearchAction event) async* {
    var response = await usecase(event.keyword);
    yield response.fold((l) => SearchError(), (r) => SearchEvent(r));
  }
}

class SearchAction extends RecipeAction {
  String keyword;

  SearchAction(this.keyword);
}

class SearchError extends RecipeEvent {
  SearchError();

  @override
  List<Object> get props => super.props;
}

class SearchEvent extends RecipeEvent {
  final List<AutoCompleteResponse> list;

  SearchEvent(this.list);

  @override
  List<Object> get props => list;
}

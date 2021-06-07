//
// import 'package:recipe_flutter/api_response/auto_complete_response.dart';
// import 'package:recipe_flutter/blocs/events.dart';
// import 'package:recipe_flutter/blocs/main/base_bloc.dart';
// import 'package:recipe_flutter/blocs/state.dart';
// import 'package:recipe_flutter/repository/RecipeRepository.dart';
// import 'package:recipe_flutter/usecase/autocomplete_usecase.dart';
//
// class SearchBlocs extends BaseBloc<SearchEvent, RecipeState> {
//   late RecipeRepository recipeRepository;
//   late AutocompleteUsecase usecase;
//
//   SearchBlocs(this.recipeRepository) : super(SearchState(List<AutoCompleteResponse>.empty()));
//
//   @override
//   Stream<RecipeState> mapEventToState(SearchEvent event) async* {
//     var response = await usecase(event.keyword);
//     yield response.fold((l) => SearchError(), (r) => SearchState(r as List<AutoCompleteResponse>));
//   }
// }
//
// class SearchEvent extends RecipeEvent {
//   String keyword;
//
//   SearchEvent(this.keyword);
// }
//
// class SearchError extends RecipeState {
//   SearchError();
//
//   @override
//   List<Object> get props => super.props;
// }
//
// class SearchState extends RecipeState {
//   final List<AutoCompleteResponse> list;
//
//   SearchState(this.list);
//
//   @override
//   List<Object> get props => list;
// }


import 'package:recipe_flutter/api_response/auto_complete_response.dart';
import 'package:recipe_flutter/blocs/main/base_bloc.dart';

abstract class SearchRecipeState extends AppState{}

class SearchInitialState extends SearchRecipeState{}

class SearchError extends SearchRecipeState {
  SearchError();

  @override
  List<Object> get props => super.props;
}

class SearchCompleteState extends SearchRecipeState {
  final List<AutoCompleteResponse> list;

  SearchCompleteState(this.list);

  @override
  List<Object> get props => list;
}
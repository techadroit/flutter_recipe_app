import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/api_response/AutoCompleteResponse.dart';
import 'package:recipe_flutter/blocs/actions.dart';
import 'package:recipe_flutter/blocs/events.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';

class SearchBlocs extends Bloc<SearchAction,SearchEvent>{

  RecipeRepository recipeRepository;

  SearchBlocs(this.recipeRepository);

  @override  
  SearchEvent get initialState => new SearchEvent(List<AutoCompleteResponse>());
  @override
  Stream<SearchEvent> mapEventToState(SearchAction event) async*{    
   List<AutoCompleteResponse> list = 
   await recipeRepository.autoComplete(event.keyword);
   yield SearchEvent(list);
  }

}

class SearchAction extends RecipeAction{
String keyword;
SearchAction(this.keyword);
}

class SearchEvent extends RecipeEvent{
  final List<AutoCompleteResponse> list;
  SearchEvent(this.list);

  @override
  List<Object> get props => list;
}
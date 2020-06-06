
class RecipeEvent {}

class SearchRecipes extends RecipeEvent {
  String keyword;
  SearchRecipes({this.keyword="chicken"});
}

class FetchRecipeDetail extends RecipeEvent{
  String id;
  FetchRecipeDetail({this.id});
}

class SearchVideos extends RecipeEvent{}

class BottomNavigationEvent extends RecipeEvent {
  int index = 0;
  BottomNavigationEvent(this.index);
}

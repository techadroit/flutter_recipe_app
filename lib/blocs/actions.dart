
class RecipeAction {}

class SearchRecipes extends RecipeAction {
  String keyword;
  SearchRecipes({this.keyword="chicken"});
}

class FetchRecipeDetail extends RecipeAction{
  String id;
  FetchRecipeDetail({this.id});
}

class SearchVideos extends RecipeAction{}

class BottomNavigationAction extends RecipeAction {
  int index = 0;
  BottomNavigationAction(this.index);
}

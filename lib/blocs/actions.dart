
class RecipeAction {}

class SearchRecipes extends RecipeAction {
  String keyword;
  SearchRecipes({this.keyword="chicken"});
}

class SearchVideos extends RecipeAction{}

class BottomNavigationAction extends RecipeAction {
  int index = 0;
  BottomNavigationAction(this.index);
}

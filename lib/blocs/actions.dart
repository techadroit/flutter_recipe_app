
class RecipeAction {}

class SearchRecipes extends RecipeAction {}

class SearchVideos extends RecipeAction{}

class BottomNavigationAction extends RecipeAction {
  int index = 0;
  BottomNavigationAction(this.index);
}

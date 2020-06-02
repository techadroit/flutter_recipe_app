class RecipeDetail {
  bool vegan = false;
  bool glutenFree = false;
  bool dairyFree = false;
  int readInMinute = 0;
  int servings = 0;
  String sourceName;
  String sourceLink;
  String imageUrl;
  String description;
  String title;
  int id;
  double score;

  List<RecipeIngredients> ingredientList = new List<RecipeIngredients>();
  List<RecipeInstruction> instructions = new List<RecipeInstruction>();
}

class RecipeIngredients {
  String ingredient;
  RecipeIngredients(this.ingredient);
}

class RecipeInstruction{
  String instruction;
  RecipeInstruction(this.instruction);
}

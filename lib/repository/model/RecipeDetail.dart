class RecipeDetail {
  bool vegan = false;
  bool glutenFree = false;
  bool dairyFree = false;
  int readInMinute = 0;
  int servings = 0;
  late String sourceName;
  late String sourceLink;
  late String imageUrl;
  late String description;
  late String title;
  late int id;
  late double score;

  List<RecipeIngredients> ingredientList = <RecipeIngredients>[];
  List<RecipeInstruction> instructions = <RecipeInstruction>[];
}

class RecipeIngredients {
  String ingredient;
  RecipeIngredients(this.ingredient);
}

class RecipeInstruction{
  String instruction;
  RecipeInstruction(this.instruction);
}

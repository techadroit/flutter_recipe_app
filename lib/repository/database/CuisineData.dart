import 'RecipeDatabase.dart';

class CuisineData {
  late String cuisine;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{CUISINE_NAME: cuisine};
    return map;
  }

  CuisineData();

  CuisineData.fromCuisine(this.cuisine);

  CuisineData.fromMap(Map<String, dynamic> map) {
    cuisine = map[CUISINE_NAME];
  }
}

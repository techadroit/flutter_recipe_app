import 'package:recipe_flutter/repository/database/CuisineData.dart';
import 'package:recipe_flutter/repository/database/RecipeData.dart';
import 'package:recipe_flutter/repository/database/RecipeDatabase.dart';
import 'package:recipe_flutter/repository/model/Cuisine.dart';
import 'package:sqflite/sqflite.dart';

class LocalRepository {
  Future<Database> getDatabase() async {
    return RecipeDatabase.getDatabase();
  }

  Future<void> addToFavourite(RecipeData data) async {
    return await getDatabase()
        .then((database) => database.insert(RECIPE_TABLE, data.toMap()));
  }

  Future<List<RecipeData>> getAllRecipes() async{
    Database database = await getDatabase();
    var response = await database.query(RECIPE_TABLE);

    List<RecipeData> list = List.empty(growable: true);
    response.forEach((element) {
      var data = RecipeData.fromMap(element);
      list.add(data);
    });
    return list.toSet().toList();
  }

  Future<void> saveRecipe(List<RecipeData> data) async {
    return await getDatabase().then((database) {
      var batch = database.batch();
      data.forEach((element) {
        batch.insert(RECIPE_TABLE, element.toMap());
      });
      batch.commit();
    });
  }

  Future<void> saveCuisines(List<CuisineData> data) async {
    return await getDatabase().then((database) {
      var batch = database.batch();
      data.forEach((element) {
        batch.insert(CUISINE_TABLE, element.toMap());
      });
      batch.commit();
    });
  }

  Future<List<Cuisine>> getSelectedCuisines() async {
    var response = await getDatabase().then((database) => database.query(
          CUISINE_TABLE,
        ));
    List<Cuisine> list = List.empty(growable: true);
    response.forEach((element) {
      var data = CuisineData.fromMap(element);
      list.add(Cuisine(data.cuisine));
    });
    return list.toSet().toList().sublist(0,5);
  }

  Future<int> delete(int id) async {
    Database database = await getDatabase();
    return await database
        .delete(RECIPE_TABLE, where: '$RECIPE_ID = ?', whereArgs: [id]);
  }

  Future close() async => getDatabase().then((onValue) => onValue.close());
}

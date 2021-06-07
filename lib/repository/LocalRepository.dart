import 'package:recipe_flutter/repository/database/RecipeData.dart';
import 'package:recipe_flutter/repository/database/RecipeDatabase.dart';
import 'package:sqflite/sqflite.dart';

class LocalRepository {
  Future<Database> getDatabase() async {
    return RecipeDatabase.getDatabase();
  }

  Future<void> addToFavourite(RecipeData data) async {
    return await getDatabase().then((database) => database.insert(RECIPE_TABLE, data.toMap()));
  }

  // Future<List<RecipeData>> getAllRecipes() async{
  //   Database database = await getDatabase();
  //   List<Map> result = await database.query(RECIPE_TABLE);
  //   return result;
  // }

  Future<int> delete(int id) async {
    Database database = await getDatabase();
    return await database.delete(RECIPE_TABLE, where: '$RECIPE_ID = ?', whereArgs: [id]);
  }

    Future close() async => getDatabase().then((onValue) => onValue.close());
}

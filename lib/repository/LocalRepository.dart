import 'package:recipe_flutter/repository/database/RecipeData.dart';
import 'package:recipe_flutter/repository/database/RecipeDatabase.dart';
import 'package:sqflite/sqflite.dart';

class LocalRepository {
  Future<Database> getDatabase() async {
    return RecipeDatabase.getDatabase();
  }

  Future<void> addToFavourite(RecipeData data) async {
    // return await getDatabase().then((value) => value.rawInsert(
    //     'INSERT INTO Recipe(recipe_id, recipe_title, recipe_body) VALUES(?, ?, ?)',
    //     [data.id, data.title, data.body]));

    return await getDatabase().then((database) => database.insert(RECIPE_TABLE, data.toMap()));
  }

  Future<List<RecipeData>> getAllRecipes() async{
    // return await getDatabase().then((value) => 
    // value.query(RECIPE_TABLE);
    Database database = await getDatabase();
    List<Map> result = await database.query(RECIPE_TABLE);    
  }

  Future<int> delete(int id) async {
    Database database = await getDatabase();
    return await database.delete(RECIPE_TABLE, where: '$RECIPE_ID = ?', whereArgs: [id]);
  }

    Future close() async => getDatabase().then((onValue) => onValue.close());
}

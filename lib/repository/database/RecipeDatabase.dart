import 'package:sqflite/sqflite.dart';

final String RECIPE_TABLE = "Recipe";
final String RECIPE_ID = "recipe_id";
final String RECIPE_TITLE = "recipe_title";
final String RECIPE_BODY = "recipe_body";

class RecipeDatabase {
  static Future<Database> getDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = databasesPath + 'recipe.db';
    return openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute('CREATE TABLE ' +
          RECIPE_TABLE +
          ' (' +
          RECIPE_ID +
          ' INTEGER PRIMARY KEY,' +
          RECIPE_TITLE +
          ' TEXT, ' +
          RECIPE_BODY +
          ' : TEXT)');
    });
  }
}

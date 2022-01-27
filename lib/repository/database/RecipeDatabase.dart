import 'package:sqflite/sqflite.dart';

const String RECIPE_TABLE = "Recipe";
const String RECIPE_ID = "recipe_id";
const String RECIPE_TITLE = "recipe_title";
const String RECIPE_IMAGE_URL = "recipe_image_url";
const String RECIPE_BODY = "recipe_body";
const String CUISINE_NAME = "cuisine_name";
const String CUISINE_TABLE = "cuisine_name";

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
          RECIPE_IMAGE_URL +
          ' TEXT, ' +
          RECIPE_BODY +
          ' TEXT)');

      await db.execute(
          'CREATE TABLE ' + CUISINE_TABLE + ' (' + CUISINE_NAME + ' TEXT)');
    });
  }
}

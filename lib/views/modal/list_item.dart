
abstract class ListItem {}

class RecipeItem extends ListItem {
  String id;
  String heading;
  String serving;
  String cookingTime;
  String imageUrl;
  bool isSaved = false;

  RecipeItem(this.id, this.heading, this.serving, this.cookingTime,
      this.imageUrl, this.isSaved);
}

class VideoRecipeItem {
  String title;
  String thumbnailurl;
  String youtubeId;
  VideoRecipeItem(this.title,this.thumbnailurl,this.youtubeId);
}


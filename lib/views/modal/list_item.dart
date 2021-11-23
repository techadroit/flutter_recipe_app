import 'package:equatable/equatable.dart';

abstract class ListItem {}

class RecipeItem extends Equatable with ListItem {
  String id;
  String heading;
  String serving;
  String cookingTime;
  String imageUrl;
  bool isSaved = false;

  RecipeItem(this.id, this.heading, this.serving, this.cookingTime,
      this.imageUrl, this.isSaved);

  @override
  List<Object?> get props =>
      [id, heading, serving, cookingTime, imageUrl, isSaved];
}

class VideoRecipeItem {
  String title;
  String thumbnailurl;
  String youtubeId;

  VideoRecipeItem(this.title, this.thumbnailurl, this.youtubeId);
}

import 'package:equatable/equatable.dart';

abstract class ListItem {}

class RecipeItem extends Equatable with ListItem {
  final String id;
  final String heading;
  final String serving;
  final String cookingTime;
  final String imageUrl;
  bool isSaved;

  RecipeItem(this.id, this.heading, this.serving, this.cookingTime,
      this.imageUrl, this.isSaved);

  @override
  List<Object?> get props =>
      [id, heading, serving, cookingTime, imageUrl, isSaved];
}

class VideoRecipeItem {
  String title;
  String thumbnailUrl;
  String youtubeId;

  VideoRecipeItem(this.title, this.thumbnailUrl, this.youtubeId);
}

import 'package:flutter/cupertino.dart';
import 'package:youtube_player/youtube_player.dart';

class YoutubeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final YoutubeArgument args = ModalRoute.of(context).settings.arguments;
    return YoutubePlayer(
        source: args.source, context: context, quality: YoutubeQuality.MEDIUM);
  }
}

class YoutubeArgument {
  String source;
  YoutubeArgument(this.source);
}

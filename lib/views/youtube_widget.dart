 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

 class YoutubeWidget extends StatelessWidget {


   @override
   Widget build(BuildContext context) {
     final YoutubeArgument args = ModalRoute
         .of(context)
         .settings
         .arguments;
     return YoutubePlayer(
       controller: YoutubePlayerController(
         initialVideoId: args.source,
         flags: YoutubePlayerFlags(
           mute: false,
           autoPlay: true,
         ),
       ),
       showVideoProgressIndicator: true,
//       videoProgressIndicatorColor: Colors.amber,
//       progressColors: ProgressColors(
//         playedColor: Colors.amber,
//         handleColor: Colors.amberAccent,
//       ),
       onReady: () {
         print('Player is ready.');
       },
     );
   }
 }

 class YoutubeArgument {
   String source;
   YoutubeArgument(this.source);
 }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/RecipeListBloc.dart';
import 'package:recipe_flutter/blocs/actions.dart';
import 'package:recipe_flutter/blocs/events.dart';
import 'package:recipe_flutter/shared/dimens.dart';

class VideoRecipeItem {
  String title;
  String thumbnailurl;
  String youtubeId;
}

class VideoListWidgetStatefull extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoRecipeListWidget();
  }
}

class VideoRecipeListWidget extends State<VideoListWidgetStatefull> {
  RecipeListBloc bloc;
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(_onScroll);
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final offset = _scrollController.offset;
    if (offset >= maxScroll && !_scrollController.position.outOfRange) {
      print(" reached bottom");
      bloc.add(SearchVideos());
    }
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of(context);
    return Center(
      child: BlocBuilder(
          bloc: bloc,
          builder: (context, state) {
            if (state is VideoRecipeLoaded) {
              var list = state.list;
              return ListView.builder(
                  controller: _scrollController,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return VideoRecipeItemWidgetV2(list[index]);
                  });
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

class VideoRecipeItemWidget extends StatelessWidget {
  VideoRecipeItem item;

  VideoRecipeItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          GestureDetector(
            onTap: () => {
              // Navigator.of(context).pushNamed("/youtube_video",arguments: YoutubeArgument(item.youtubeId))
            },
            child: Image.network(
              item.thumbnailurl,
              height: 100,
              width: 120,
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 8, top: 16),
              child: Text(item.title))
        ],
      ),
    );
  }
}

class VideoRecipeItemWidgetV2 extends StatelessWidget {
  VideoRecipeItem item;

  VideoRecipeItemWidgetV2(this.item);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () => {
              // Navigator.of(context).pushNamed("/youtube_video",arguments: YoutubeArgument(item.youtubeId))
            },
            child: Stack(
              alignment: Alignment.center,
              children:<Widget>[
                Image.network(item.thumbnailurl,
                height: IMAGE_HEIGHT, width: double.infinity, fit: BoxFit.cover),    
                Container(
                  height: IMAGE_HEIGHT,
                  width: double.infinity,
                  color: Colors.black26,
                ),           
                  GestureDetector(
                  onTap: (){
                    // Navigator.of(context).pushNamed("/youtube_video",arguments: YoutubeArgument(item.youtubeId))
                  },
                  child:IconButton(
                  iconSize: 64,
                  color: Colors.white70,
                  icon: Icon(
                    Icons.play_circle_outline
                    ),
                   onPressed: (){})
                )
              ]
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 8, top: 16,bottom: 8),
              child: Text(item.title))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/MainBloc.dart';
import 'package:recipe_flutter/blocs/RecipeListBloc.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/network/RecipeApiClient.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_flutter/views/ListWidget.dart';
import 'package:recipe_flutter/views/widgetvideorecipe.dart';
import 'package:recipe_flutter/views/youtube_widget.dart';

import 'blocs/actions.dart';
import 'blocs/events.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(new MaterialApp(
    title: "Widget",
    initialRoute: '/',
    routes: {
      '/': (context) => BlocProvider(
            create: (BuildContext context) => MainBloc(),
            child: BottomWidgetContainer(),
          ),
      '/youtube_video': (context) => YoutubeWidget()
    },
    theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: TextTheme(
            headline: TextStyle(fontSize: 24, fontFamily: 'RobotMono'))),
  ));
}

class BottomWidgetContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: BlocBuilder<MainBloc, RecipeEvent>(
          bloc: BlocProvider.of(context),
          builder: (context, state) {
            if (state is BottomNavigationEvent) {
              var index = state.index;
              switch (index) {
                case 0:
                  return getRecipeWidget();
                  break;
                case 1:
                  return ScreenWidget(Colors.blue);
                  break;
                case 2:
                  return getVideoRecipeWidget();
                  break;
                case 3:
                  return ScreenWidget(Colors.orange);
                  break;
              }
            }
          }),
      bottomNavigationBar: BottomNavigationWidgetStateFull(),
    ));
  }
}

class ScreenWidget extends StatelessWidget {
  Color color;

  ScreenWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(color: color);
  }
}

class BottomNavigationWidgetStateFull extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationWidget();
  }
}

class BottomNavigationWidget extends State<BottomNavigationWidgetStateFull> {
  var currentIndex = 0;
  MainBloc bloc;

  BottomNavigationWidget();

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of(context);
    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          bloc.add(BottomNavigationAction(index));
        },
        currentIndex: currentIndex,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              backgroundColor: Colors.blue,
              title: Text("Recipes")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              backgroundColor: Colors.blue,
              title: Text("Favourites")),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_call),
              backgroundColor: Colors.blue,
              title: Text("Videos")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              backgroundColor: Colors.blue,
              title: Text("Settings")),
        ]);
  }
}

Widget getRecipeWidget() {
  final RecipeRepository recipeRepository = RecipeRepository(
    recipeApiClient: RecipeApiClient(
      httpClient: http.Client(),
    ),
  );
  return BlocProvider(
    create: (BuildContext context) =>
        RecipeListBloc(repository: recipeRepository),
    child: RecipeListContainerWidget(),
  );
}

Widget getVideoRecipeWidget() {
  final RecipeRepository recipeRepository = RecipeRepository(
    recipeApiClient: RecipeApiClient(
      httpClient: http.Client(),
    ),
  );
  return BlocProvider(
    key: PageStorageKey("video"),
    create: (BuildContext context) =>
        RecipeListBloc(repository: recipeRepository)..add(SearchVideos()),
    child: VideoListWidgetStatefull(),
  );
}

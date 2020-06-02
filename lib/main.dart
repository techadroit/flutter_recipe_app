import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/MainBloc.dart';
import 'package:recipe_flutter/blocs/RecipeListBloc.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/network/RecipeApiClient.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_flutter/views/ListWidget.dart';
import 'package:recipe_flutter/views/recipe_detail_widget.dart';
import 'package:recipe_flutter/views/search_widget.dart';
import 'package:recipe_flutter/views/widgetvideorecipe.dart';

import 'blocs/actions.dart';
import 'blocs/events.dart';
final RecipeRepository recipeRepository = RecipeRepository(
    recipeApiClient: RecipeApiClient(
      httpClient: http.Client(),
    ),
  );
 
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
      '/search': (context) => SearchWiget(),
      '/searchList':(context) => RecipeListParentWidget(),
      '/recipeDetail':(context) => RecipeDetailParentWidget()
      // '/youtube_video': (context) => YoutubeWidget()
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
 var listbloc = RecipeListBloc(repository: recipeRepository);

Widget getRecipeWidget() {
  
  return BlocProvider(
    create: (BuildContext context) => listbloc,
    child: RecipeListContainerWidget(),
  );
}

Widget getVideoRecipeWidget() {
  return BlocProvider(
    key: PageStorageKey("video"),
    create: (BuildContext context) =>
        RecipeListBloc(repository: recipeRepository)..add(SearchVideos()),
    child: VideoListWidgetStatefull(),
  );
}

var searchView = Center(
    child: Wrap(children: [
  Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.0, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(12.0))),
    child: Row(children: [Icon(Icons.search),Expanded(child:Text('Search'))]),
  )
]));

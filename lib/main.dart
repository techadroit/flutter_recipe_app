import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/main/GlobalBlocObserver.dart';
import 'package:recipe_flutter/blocs/recipe_list/recipe_list_bloc.dart';
import 'package:recipe_flutter/blocs/video_recipes/recipe_video_bloc.dart';
import 'package:recipe_flutter/core/network/network_handler.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';
import 'package:recipe_flutter/usecase/recipe_search_usecase.dart';
import 'package:recipe_flutter/views/error_screen.dart';
import 'package:recipe_flutter/views/list_widget.dart';
import 'package:recipe_flutter/views/recipe_detail_widget.dart';
import 'package:recipe_flutter/views/search_widget.dart';
import 'package:recipe_flutter/views/video_recipe_widget.dart';
import 'package:recipe_flutter/views/youtube_widget.dart';

import 'blocs/video_recipes/recipe_video_events.dart';

const baseUrl = 'https://api.spoonacular.com';

void main() {
  Bloc.observer = GlobalBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black54,
    ),
  );
  NetworkHandler().init(baseUrl);
  String initialRoute = RemoteDataSource.apikey.isEmpty ? "/error" : "/";
  runApp(new MaterialApp(
    title: "Widget",
    initialRoute: initialRoute,
    routes: {
      '/': (context) => BottomWidgetContainer(),
      '/error': (context) => ErrorScreen(),
      '/search': (context) => SearchWiget(),
      '/searchList': (context) => RecipeListParentWidget(),
      '/recipeDetail': (context) => RecipeDetailParentWidget(),
      '/youtube_video': (context) => YoutubeWidget()
    },
    theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Raleway',
        textTheme: TextTheme(
            headline: TextStyle(fontSize: 24, fontFamily: 'RobotMono'))),
  ));
}

class BottomWidgetContainer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomWidgetState();
  }
}

class BottomWidgetState extends State<BottomWidgetContainer> {
  final list = [getRecipeWidget(), getVideoRecipeWidget()];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: list[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                backgroundColor: Colors.blue,
                title: Text("Recipes")),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_call),
                backgroundColor: Colors.blue,
                title: Text("Videos")),
          ]),
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

Widget getRecipeWidget() {
  final RecipeRepository recipeRepository = RecipeRepository(
    RemoteDataSource(NetworkHandler().dio),
  );
  final listbloc = RecipeListBloc(recipeRepository);
  listbloc.recipeUsecase = SearchRecipeUsecase(recipeRepository);
  return BlocProvider(
    create: (BuildContext context) => listbloc,
    child: RecipeListContainerWidget(),
  );
}

Widget getVideoRecipeWidget() {
  final RecipeRepository recipeRepository = RecipeRepository(
    RemoteDataSource(NetworkHandler().dio),
  );
  var bloc = VideoRecipeBloc(recipeRepository);
  bloc.videoRecipeUsecase = SearchVideoRecipeUsecase(recipeRepository);

  return BlocProvider(
    key: PageStorageKey("video"),
    create: (BuildContext context) => bloc..add(SearchVideos()),
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
    child: Row(children: [Icon(Icons.search), Expanded(child: Text('Search'))]),
  )
]));

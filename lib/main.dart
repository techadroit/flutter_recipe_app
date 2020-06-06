import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/MainBloc.dart';
import 'package:recipe_flutter/blocs/RecipeListBloc.dart';
import 'package:recipe_flutter/core/network/network_handler.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';
import 'package:recipe_flutter/usecase/recipe_search_usecase.dart';
import 'package:recipe_flutter/views/ListWidget.dart';
import 'package:recipe_flutter/views/recipe_detail_widget.dart';
import 'package:recipe_flutter/views/search_widget.dart';
import 'package:recipe_flutter/views/widgetvideorecipe.dart';
import 'package:recipe_flutter/views/youtube_widget.dart';

import 'blocs/actions.dart';
import 'blocs/events.dart';

const baseUrl = 'https://api.spoonacular.com';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.blueAccent,
    ),
  );
  NetworkHandler().init(baseUrl);
  runApp(new MaterialApp(
    title: "Widget",
    initialRoute: '/',
    routes: {
      '/': (context) => BlocProvider(
            create: (BuildContext context) => MainBloc(),
            child: BottomWidgetContainer(),
          ),
      '/search': (context) => SearchWiget(),
      '/searchList': (context) => RecipeListParentWidget(),
      '/recipeDetail': (context) => RecipeDetailParentWidget(),
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
          // ignore: missing_return
          builder: (context, state) {
            if (state is BottomNavigationEvent) {
              var index = state.index;
              switch (index) {
                case 0:
                  return getRecipeWidget();
                  break;
                case 1:
                  return getVideoRecipeWidget();
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
              icon: Icon(Icons.video_call),
              backgroundColor: Colors.blue,
              title: Text("Videos")),
        ]);
  }
}

Widget getRecipeWidget() {
  final RecipeRepository recipeRepository = RecipeRepository(
    dataSource: RemoteDataSource(NetworkHandler().dio),
  );
  var listbloc = RecipeListBloc(repository: recipeRepository);
  listbloc.videoRecipeUsecase = SearchVideoRecipeUsecase(recipeRepository);
  listbloc.recipeUsecase = SearchRecipeUsecase(recipeRepository);
  return BlocProvider(
    create: (BuildContext context) => listbloc,
    child: RecipeListContainerWidget(),
  );
}

Widget getVideoRecipeWidget() {
  final RecipeRepository recipeRepository = RecipeRepository(
    dataSource: RemoteDataSource(NetworkHandler().dio),
  );
  var bloc = RecipeListBloc(repository: recipeRepository);
  bloc.videoRecipeUsecase = SearchVideoRecipeUsecase(recipeRepository);
  bloc.recipeUsecase = SearchRecipeUsecase(recipeRepository);

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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/main/GlobalBlocObserver.dart';
import 'package:recipe_flutter/core/network/network_handler.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';
import 'package:recipe_flutter/repository/services/SearchRecipeService.dart';
import 'package:recipe_flutter/views/repository_provider.dart';
import 'package:recipe_flutter/views/user_interest_screen.dart';
import 'package:recipe_flutter/views/bottom_widget.dart';
import 'package:recipe_flutter/views/error_screen.dart';
import 'package:recipe_flutter/views/list_widget.dart';
import 'package:recipe_flutter/views/recipe_detail_widget.dart';
import 'package:recipe_flutter/views/search_widget.dart';
import 'package:recipe_flutter/views/youtube_widget.dart';

const baseUrl = 'https://api.spoonacular.com';
final mainNavigationKey = GlobalKey<NavigatorState>();

const userInterestRoute = '/';
const mainRoute = '/main';
const errorRoute = '/error';
const searchRoute = '/search';
const searchListRoute = '/searchList';
const recipeDetailRoute = '/recipeDetail';
const youtubeVideoRoute = '/youtube_video';

void main() {
  Bloc.observer = GlobalBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black54,
    ),
  );
  NetworkHandler().init(baseUrl);
  runApp(RepositoryWidget(MainWidget()));
}

class MainWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    String initialRoute = RemoteDataSource.apikey.isEmpty ? errorRoute : userInterestRoute;
    var recipeService = context.read<RecipeService>();
    var searchService = context.read<SearchRecipeService>();
    return new MaterialApp(
      title: "Widget",
      navigatorKey: mainNavigationKey,
      initialRoute: initialRoute,
      routes: {
        userInterestRoute: (context) => UserInterestScreenWidget(recipeService),
        mainRoute: (context) => BottomWidgetContainer(recipeService,searchService),
        errorRoute: (context) => InvalidKeyErrorScreen(),
        searchRoute: (context) => SearchWiget(searchService),
        searchListRoute: (context) => RecipeAutoCompleteListWidget(searchService),
        recipeDetailRoute: (context) => RecipeDetailParentWidget(),
        youtubeVideoRoute: (context) => YoutubeWidget(),
      },
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: 'Raleway',
          textTheme: TextTheme(
              headline1: TextStyle(fontSize: 24, fontFamily: 'RobotMono'))),
    );
  }
}
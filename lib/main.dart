import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/main/GlobalBlocObserver.dart';
import 'package:recipe_flutter/core/network/network_handler.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';
import 'package:recipe_flutter/repository/services/SearchRecipeService.dart';
import 'package:recipe_flutter/shared/colors.dart';
import 'package:recipe_flutter/shared/dimens.dart';
import 'package:recipe_flutter/views/home/bottom_widget.dart';
import 'package:recipe_flutter/views/main/error_screen.dart';
import 'package:recipe_flutter/views/main/repository_provider.dart';
import 'package:recipe_flutter/views/recipe_videos/youtube_widget.dart';
import 'package:recipe_flutter/views/recipes_list/list_widget.dart';
import 'package:recipe_flutter/views/recipes_list/recipe_detail_widget.dart';
import 'package:recipe_flutter/views/recipes_list/search_widget.dart';
import 'package:recipe_flutter/views/user_interest/user_interest_screen.dart';

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

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String initialRoute =
        RemoteDataSource.apikey.isEmpty ? errorRoute : userInterestRoute;
    var recipeService = context.read<RecipeService>();
    var searchService = context.read<SearchRecipeService>();
    return new MaterialApp(
      title: "Widget",
      navigatorKey: mainNavigationKey,
      initialRoute: initialRoute,
      routes: {
        userInterestRoute: (context) => UserInterestScreenWidget(recipeService),
        mainRoute: (context) =>
            BottomWidgetContainer(recipeService, searchService),
        errorRoute: (context) => InvalidKeyErrorScreen(),
        searchRoute: (context) => SearchWiget(searchService),
        searchListRoute: (context) =>
            RecipeAutoCompleteListWidget(searchService),
        recipeDetailRoute: (context) => RecipeDetailParentWidget(),
        youtubeVideoRoute: (context) => YoutubeWidget(),
      },
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: 'Raleway',
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 18,
                fontFamily: 'RobotMono',
                fontWeight: FontWeight.w500),
            headline2: TextStyle(
                color: titleColor,
                fontFamily: 'RobotMono-Bold',
                fontWeight: FontWeight.bold,
                fontSize: TITLE_TEXT_SIZE),
            bodyText1: TextStyle(
                fontSize: 18,
                fontFamily: "RobotoMono",
                fontWeight: FontWeight.w500),
            bodyText2: TextStyle(
                fontSize: 18,
                fontFamily: "Raleway",
                fontWeight: FontWeight.w200),
            subtitle1: TextStyle(
                fontSize: 24,
                fontFamily: "RobotoMono",
                fontWeight: FontWeight.w500),
          ),
          accentTextTheme: TextTheme(
            bodyText1: TextStyle(
                color: Colors.grey[700],
                fontSize: 12,
                fontFamily: 'RobotoMono'),
            bodyText2: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: 'RobotoMono'),
            subtitle1: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontFamily: 'RobotoMono'),
            subtitle2: TextStyle(
                color: Colors.grey, fontFamily: 'RobotoMono', fontSize: 10),
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/main/GlobalBlocObserver.dart';
import 'package:recipe_flutter/core/network/network_handler.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';
import 'package:recipe_flutter/views/bottom_widget.dart';
import 'package:recipe_flutter/views/error_screen.dart';
import 'package:recipe_flutter/views/list_widget.dart';
import 'package:recipe_flutter/views/recipe_detail_widget.dart';
import 'package:recipe_flutter/views/search_widget.dart';
import 'package:recipe_flutter/views/youtube_widget.dart';

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
      '/searchList': (context) => RecipeAutoCompleteListWidget(),
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
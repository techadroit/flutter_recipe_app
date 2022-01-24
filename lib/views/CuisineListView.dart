import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/cuisine_list/CuisineListBloc.dart';
import 'package:recipe_flutter/blocs/cuisine_list/CuisineListEvent.dart';
import 'package:recipe_flutter/blocs/cuisine_list/CuisineListState.dart';
import 'package:recipe_flutter/core/network/network_handler.dart';
import 'package:recipe_flutter/main.dart';
import 'package:recipe_flutter/repository/LocalRepository.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/model/Cuisine.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';
import 'package:recipe_flutter/shared/colors.dart';
import 'package:recipe_flutter/shared/dimens.dart';
import 'package:recipe_flutter/views/list_widget.dart';
import 'package:recipe_flutter/views/modal/list_item.dart';
import 'package:recipe_flutter/views/modal/search_item.dart';

final _cuisineNavigationKey = GlobalKey<NavigatorState>();

const cuisineList = "/cuisineList";
const recipeList = "/recipeList";

class CuisineWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Navigator(
        key: _cuisineNavigationKey,
        initialRoute: cuisineList,
        onGenerateRoute: _onGenerateRoute,
      ),
      onWillPop: () async {
        final NavigatorState? navigator = _cuisineNavigationKey.currentState;
        var result = await navigator?.maybePop() ?? false;
        return !result;
      },
    );
  }

  Route _onGenerateRoute(RouteSettings settings) {
    late Widget page;
    switch (settings.name) {
      case cuisineList:
        page = CuisineListView();
        break;
      case recipeList:
        page = RecipeListContainerWidget.get(settings.arguments as SearchItem);
        break;
    }
    return MaterialPageRoute<dynamic>(
      builder: (context) {
        return Scaffold(body: page);
      },
      settings: settings,
    );
  }
}

class CuisineListView extends StatefulWidget {
  late RecipeService recipeService;
  late CuisineListBloc bloc;

  CuisineListView() {
    final RecipeRepository recipeRepository = RecipeRepository(
      RemoteDataSource(NetworkHandler().dio),
    );
    recipeService = RecipeService(LocalRepository(), recipeRepository);
    bloc = CuisineListBloc(recipeService)..add(LoadAllCuisines());
  }

  @override
  State<StatefulWidget> createState() {
    return _CuisineListViewState();
  }
}

class _CuisineListViewState extends State<CuisineListView> {
  @override
  Widget build(BuildContext context) {
    var bloc = widget.bloc;
    return Container(
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, CuisineListState state) {
          var list = state.recipeList;
          if (list.isNotEmpty) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: ShrinkWrappingViewport(
                    offset: ViewportOffset.zero(),
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            var cuisineWithRecipe = list[index];
                            var cuisine = cuisineWithRecipe.cuisine;
                            var recipeList = cuisineWithRecipe.recipes;
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    cuisine.cuisine,
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: titleColor,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'RobotoMono'),
                                  ),
                                ),
                                SizedBox(
                                  height: 260,
                                  child: RecipeList(recipeList,cuisine),
                                )
                              ],
                            );
                          },
                          childCount: list.length,
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  late List<RecipeItem> list;
  late Cuisine cuisine;
  RecipeList(this.list,this.cuisine);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(scrollDirection: Axis.horizontal, slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            if (index == list.length) {
              return ViewAllView(cuisine.cuisine);
            } else {
              var recipes = list[index];
              return RecipeGridItemStateFullWidget(recipes);
            }
          },
          childCount: list.length + 1,
        ),
      )
    ]);
  }
}

class RecipeGridItemStateFullWidget extends StatefulWidget {
  RecipeItem item;

  RecipeGridItemStateFullWidget(this.item);

  @override
  State<StatefulWidget> createState() {
    return RecipeGridItem(item);
  }
}

class RecipeGridItem extends State<RecipeGridItemStateFullWidget> {
  RecipeItem item;

  RecipeGridItem(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          mainNavigationKey.currentState
              ?.pushNamed(recipeDetailRoute, arguments: item.id);
        },
        child: Container(
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Card(
                elevation: 5,
                child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(children: <Widget>[
                      Container(
                          child: Image.network(item.imageUrl,
                              height: IMAGE_HEIGHT,
                              width: IMAGE_WIDTH,
                              fit: BoxFit.cover)),
                      SizedBox(
                        width: 220,
                        child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Text(
                              item.heading,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontFamily: 'Raleway-SemiBold'),
                            )),
                      ),
                    ])))));
  }
}

class ViewAllView extends StatelessWidget {

  String cuisine;
  ViewAllView(this.cuisine);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, recipeList,arguments: SearchItem(keyword: cuisine));
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Text("View All",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway')),
        ),
      ),
    );
  }
}

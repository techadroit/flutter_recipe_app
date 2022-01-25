import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/recipe_list/recipe_events.dart';
import 'package:recipe_flutter/blocs/recipe_list/recipe_list_bloc.dart';
import 'package:recipe_flutter/blocs/recipe_list/recipe_state.dart';
import 'package:recipe_flutter/core/network/network_handler.dart';
import 'package:recipe_flutter/repository/LocalRepository.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';
import 'package:recipe_flutter/shared/dimens.dart';
import 'package:recipe_flutter/usecase/recipe_search_usecase.dart';
import 'package:recipe_flutter/views/common/save_icon.dart';
import 'package:recipe_flutter/views/error_screen.dart';

import '../main.dart';
import 'modal/list_item.dart';
import 'modal/search_item.dart';

class RecipeListItemWidgetV2 extends State<RecipeListItemStateFullWidget> {
  RecipeItem item;

  RecipeListItemWidgetV2(this.item);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          mainNavigationKey.currentState
              ?.pushNamed(recipeDetailRoute, arguments: item.id);
        },
        child: Container(
            padding: EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Card(
                elevation: 5,
                child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Column(children: <Widget>[
                      Container(
                          child: Image.network(item.imageUrl,
                              height: IMAGE_HEIGHT,
                              width: double.infinity,
                              fit: BoxFit.cover)),
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Text(
                                        item.heading,
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'RobotoMono'),
                                      )),
                                ])),
                            SaveIconWidget(item.isSaved, () {
                              RecipeListBloc bloc = BlocProvider.of(context);
                              item.isSaved = !item.isSaved;
                              bloc.add(SaveRecipes(item));
                            })
                          ]),
                    ])))));
  }
}

class RecipeListContainerWidget extends StatelessWidget {
  static Widget get(SearchItem searchItem) {
    final RecipeRepository recipeRepository = RecipeRepository(
      RemoteDataSource(NetworkHandler().dio),
    );
    RecipeService recipeService =
        RecipeService(LocalRepository(), recipeRepository);
    final searchRecipeUsecase = SearchRecipeUsecase(recipeRepository);
    final listbloc =
        RecipeListBloc(recipeRepository, recipeService, searchRecipeUsecase);
    listbloc.recipeUsecase = SearchRecipeUsecase(recipeRepository);
    return BlocProvider(
      create: (BuildContext context) => listbloc,
      child: RecipeListContainerWidget(searchItem),
    );
  }

  late RecipeListBloc bloc;
  late SearchItem searchItem;

  RecipeListContainerWidget(this.searchItem);

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of(context);
    return Column(children: <Widget>[
      GestureDetector(
          onTap: () {
            mainNavigationKey.currentState?.pushNamed(searchRoute);
          },
          child: searchView),
      Expanded(
        child: RecipeListStateFullWidget(searchItem),
      ),
    ]);
  }
}

class RecipeListStateFullWidget extends StatefulWidget {
  late SearchItem searchItem;

  RecipeListStateFullWidget(this.searchItem);

  @override
  State<StatefulWidget> createState() {
    return RecipeListWidgetState(searchItem);
  }
}

class RecipeListWidgetState extends State<RecipeListStateFullWidget> {
  late SearchItem searchItem;
  ScrollController scrollController = ScrollController();

  RecipeListWidgetState(this.searchItem);

  @override
  void initState() {
    super.initState();
  }

  _scrollListener() {
    if (scrollController.hasClients &&
        scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      debugPrint(" reached bottom");
    }
  }

  @override
  Widget build(BuildContext context) {
    RecipeListBloc bloc = BlocProvider.of(context);
    return BlocBuilder(
      bloc: bloc
        ..add(SearchRecipes(
            keyword: searchItem.keyword, isSearch: searchItem.search)),
      // ignore: missing_return
      builder: (context, RecipeState state) {
        if (state.error != null) {
          return ErrorScreen.get(state.error!.failure);
        } else if (state.results.isNotEmpty) {
          var list = state.results;
          return loadList(list);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget loadList(List<RecipeItem> list) {
    return ListView.builder(
        controller: scrollController,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return RecipeListItemStateFullWidget(list[index]);
        });
  }
}

class RecipeAutoCompleteListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SearchItem searchItem =
        ModalRoute.of(context)!.settings.arguments as SearchItem;
    final RecipeRepository recipeRepository = RecipeRepository(
      RemoteDataSource(NetworkHandler().dio),
    );
    RecipeService recipeService =
        RecipeService(LocalRepository(), recipeRepository);
    final searchRecipeUsecase = SearchRecipeUsecase(recipeRepository);
    var listbloc =
        RecipeListBloc(recipeRepository, recipeService, searchRecipeUsecase);
    return BlocProvider(
        create: (BuildContext buildcontext) => listbloc,
        child: Container(
          color: Colors.white,
          child: RecipeListStateFullWidget(searchItem),
        ));
  }
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

class RecipeListItemStateFullWidget extends StatefulWidget {
  RecipeItem item;

  RecipeListItemStateFullWidget(this.item);

  @override
  State<StatefulWidget> createState() {
    return RecipeListItemWidgetV2(item);
  }
}

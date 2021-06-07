import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/recipe_search/search_recipe_bloc.dart';
import 'package:recipe_flutter/blocs/recipe_search/search_recipe_events.dart';
import 'package:recipe_flutter/blocs/recipe_search/search_recipe_state.dart';
import 'package:recipe_flutter/core/network/network_handler.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';
import 'package:recipe_flutter/usecase/autocomplete_usecase.dart';
import 'package:recipe_flutter/views/list_widget.dart';

class SearchWiget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final RecipeRepository recipeRepository = RecipeRepository(
      RemoteDataSource(NetworkHandler().dio),
    );
    SearchBlocs blocs = SearchBlocs(recipeRepository);
    blocs.usecase = AutocompleteUsecase(recipeRepository);
    return Scaffold(
        body: SafeArea(
            child: BlocProvider<SearchBlocs>(
                create: (context) => blocs, child: searchWidget())));
  }
}

Widget searchWidget() {
  return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[SearchWidget(), Expanded(child: SearchListWidget())],
      ));
}

class SearchWidget extends StatefulWidget {
  @override
  _SearchStateLessWidgetState createState() => _SearchStateLessWidgetState();
}

class _SearchStateLessWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    SearchBlocs bloc = BlocProvider.of(context);
    return Center(
        child: Wrap(children: [
      Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1.0, color: Colors.grey),
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        child: Row(children: [
          Icon(Icons.search),
          Expanded(
              child: TextField(
                  autofocus: true,
                  onChanged: (text) {
                    bloc.add(SearchEvent(text));
                  },
                  decoration: InputDecoration(hintText: 'Search')))
        ]),
      )
    ]));
  }
}

class SearchListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBlocs, SearchRecipeState>(
        bloc: BlocProvider.of(context),
        builder: (context, state) {
          if (state is SearchCompleteState && state.list.length > 0) {
            var list = state.list;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, position) {
                  var item = list[position];
                  return getSearchItemWidget(context, item.title!);
                });
          } else {
            return Container(
              color: Colors.white,
              child: Text("No Result Found"),
            );
          }
        });
  }
}

Widget getSearchItemWidget(BuildContext context, String title) {
  return GestureDetector(
      onTap: () {
        Navigator.popAndPushNamed(context, "/searchList",
            arguments: SearchItem(keyword: title));
      },
      child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 12),
          padding: EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontFamily: 'RobotoMono-Medium'),
          )));
}

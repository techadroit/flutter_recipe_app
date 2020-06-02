import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/RecipeListBloc.dart';
import 'package:recipe_flutter/blocs/actions.dart';
import 'package:recipe_flutter/blocs/events.dart';
import 'package:recipe_flutter/main.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/network/RecipeApiClient.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_flutter/shared/dimens.dart';

class SearchItem {
  String keyword;
  SearchItem({this.keyword = "chicken"});
}

abstract class ListItem {}

class RecipeItem extends ListItem {
  String heading;
  String serving;
  String cookingTime;
  String imageUrl;
  bool isSaved = false;
}

class RecipeListItemStateFullWidget extends StatefulWidget {
  RecipeItem item;
  RecipeListItemStateFullWidget(this.item);

  @override
  State<StatefulWidget> createState() {
    return RecipeListItemWidgetV2(item);
  }
}


class RecipeListItemWidgetV2 extends State<RecipeListItemStateFullWidget> {
  RecipeItem item;

  RecipeListItemWidgetV2(this.item);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context,"/recipeDetail");
        },
      child:Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Card(
            elevation: 5,
            child: Padding(
                padding: EdgeInsets.all(0),
                child:
                    Column( children: <Widget>[
                      Container(
                        child:Image.network(
                          item.imageUrl,
                          height: IMAGE_HEIGHT,
                          width: double.infinity,
                          fit: BoxFit.cover
                        )
                      )
                      ,
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[                        
                        Expanded(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                            Container(
                    child: IconButton(
                        icon: Icon(
                          item.isSaved ? Icons.favorite : Icons.favorite_border,
                          color: item.isSaved ? Colors.red : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            item.isSaved = true;
                          });
                        }),
                  )
                
                      ]),
                  ]))))  
    );
    }
}

class RecipeListContainerWidget extends StatelessWidget {
  RecipeListBloc bloc;

  RecipeListContainerWidget();
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of(context);
    return Column(children: <Widget>[
      GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/search');
          },
          child: searchView),
      Expanded(
        child: RecipeListWidget(new SearchItem()),
      ),
    ]);
  }
}

class RecipeListWidget extends StatelessWidget {
  SearchItem searchItem;
  RecipeListWidget(this.searchItem);
  @override
  Widget build(BuildContext context) {
    RecipeListBloc bloc = BlocProvider.of(context);
    return BlocBuilder(
      bloc: bloc,
      builder: (context, state) {
        if (state is RecipeUninitialized) {
          bloc.add(SearchRecipes(keyword: searchItem.keyword));
        } else if (state is RecipeLoaded) {
          var list = state.results;
          return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return RecipeListItemStateFullWidget(list[index]);
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class RecipeListParentWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SearchItem searchItem = ModalRoute.of(context).settings.arguments;
    final RecipeRepository recipeRepository = RecipeRepository(
      recipeApiClient: RecipeApiClient(
        httpClient: http.Client(),
      ),
    );
    var listbloc = RecipeListBloc(repository: recipeRepository);

    return BlocProvider(
        create: (BuildContext buildcontext) => listbloc,
        child: Container(
          color: Colors.white,
          child: RecipeListWidget(searchItem),
        ));
  }
}

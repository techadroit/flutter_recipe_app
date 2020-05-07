import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/RecipeListBloc.dart';
import 'package:recipe_flutter/blocs/actions.dart';
import 'package:recipe_flutter/blocs/events.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';

abstract class ListItem {}

class RecipeItem extends ListItem {
  String heading;
  String serving;
  String cookingTime;
  String imageUrl;
  bool isSaved = false;
}

class RecipeListItemStateFullWidget extends StatefulWidget{

RecipeItem item;
RecipeListItemStateFullWidget(this.item);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RecipeListItemWidget(item);
  }

}

class RecipeListItemWidget extends State<RecipeListItemStateFullWidget> {
  RecipeItem item;

  RecipeListItemWidget(this.item);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Card(
            elevation: 5,
            child: Padding(
                padding: EdgeInsets.all(0),
                child:
                    Stack(alignment: Alignment.bottomRight, children: <Widget>[
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.network(
                          item.imageUrl,
                          fit: BoxFit.fill,
                          height: 140,
                          width: 140,
                        ),
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
                            ]))
                      ]),
                  Container(
                    child: IconButton(
                        icon: Icon(
                          item.isSaved ? Icons.favorite : Icons.favorite_border,
                          color: item.isSaved ? Colors.red : Colors.grey,
                        ),
                        onPressed: (){
                          setState((){
                              item.isSaved = true;
                          });
                        }),
                  )
                ]))));
  }
}

class RecipeListParentWidget extends StatelessWidget {
  final RecipeRepository repository;
  RecipeListParentWidget({Key key, @required this.repository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Recip List",
      home: BlocProvider<RecipeListBloc>(
        create: (context) => RecipeListBloc(repository: repository),
        child: RecipeListContainerWidget(),
      ),
    );
  }
}

class RecipeListContainerWidget extends StatelessWidget {
  RecipeListBloc bloc;

  RecipeListContainerWidget();
  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of(context);
    return Center(
      child: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          if (state is RecipeUninitialized) {
            bloc.add(SearchRecipes());
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
      ),
    );
  }
}

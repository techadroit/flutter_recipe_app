import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:recipe_flutter/blocs/actions.dart';
import 'package:recipe_flutter/blocs/events.dart';
import 'package:recipe_flutter/blocs/recipe_detail.dart';
import 'package:recipe_flutter/repository/model/RecipeDetail.dart';
import 'package:recipe_flutter/shared/colors.dart';
import 'package:recipe_flutter/shared/dimens.dart';

import '../main.dart';

class RecipeDetailParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeDetailParentState();
  }
}

class RecipeDetailParentState extends State<RecipeDetailParentWidget> {
  RecipeDetailBloc bloc = RecipeDetailBloc(recipeRepository);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context).settings.arguments;
    bloc.add(FetchRecipeDetail(id: id));
    return BlocProvider(
        create: (BuildContext context) => bloc,
        child: Scaffold(
          body: RecipeDetailWidget(),
        ));
  }
}

class RecipeDetailWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RecipeDetailBloc bloc = BlocProvider.of<RecipeDetailBloc>(context);
    return BlocBuilder(
        bloc: bloc,
        // ignore: missing_return
        builder: (context, state) {
          if (state is RecipeUninitialized || state is RecipeLoad) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RecipeDetailState) {
            return getDetailBody(state.recipeDetail);
          }
        });
  }
}

var insets = EdgeInsets.only(left: 12, right: 12, top: 12);

Widget getDetailBody(RecipeDetail recipeDetail) {
  return ListView(
//    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Image.network(
        recipeDetail.imageUrl,
        fit: BoxFit.contain,
        height: 240,
      ),
      Padding(
        padding: insets,
        child: Text(
          recipeDetail.title,
          style: TextStyle(
              color: titleColor,
              fontFamily: 'RobotMono-Bold',
              fontWeight: FontWeight.bold,
              fontSize: TITLE_TEXT_SIZE),
        ),
      ),
      Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
          child: Text(
            recipeDetail.sourceName,
            style: TextStyle(color: Colors.grey, fontSize: 10),
          )),
      Padding(padding: insets, child: getTimeInfo(recipeDetail)),
      Padding(
          padding: insets,
          child: Text(
            "Description",
            style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15,
                fontFamily: 'RobotoMono'),
          )),
      Padding(
          padding:insets,
          child: Html(data: recipeDetail.description,
          )),
//      getIngredients(recipeDetail.ingredientList)
    ],
  );
}

Widget getIngredients(List<RecipeIngredients> list) {
  return ListView.builder(
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        var item = list[index];
        return ListTile(title: Text(item.ingredient));
      });
}

Widget getTimeInfo(RecipeDetail recipeDetail) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      getHorizontalTextView(
          "Servings", recipeDetail.servings.toString() + "ppl"),
      getHorizontalTextView(
          "Cook Time", recipeDetail.readInMinute.toString() + "m"),
      getHorizontalTextView("Score", recipeDetail.score.toString()),
    ],
  );
}

Widget getHorizontalTextView(String text1, String text2) {
  return Column(children: <Widget>[
    Text(
      text1,
      style: TextStyle(
          color: Colors.grey[700], fontSize: 12, fontFamily: 'RobotoMono'),
    ),
    Text(text2,
        style: TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'))
  ]);
}

var headingStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.bold);

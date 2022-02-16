import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:recipe_flutter/blocs/recipe_detail/recipe_detail.dart';
import 'package:recipe_flutter/blocs/recipe_detail/recipe_detail_event.dart';
import 'package:recipe_flutter/blocs/recipe_detail/recipe_detail_state.dart';
import 'package:recipe_flutter/repository/model/RecipeDetail.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';
import 'package:recipe_flutter/extensions/buildcontext_ext.dart';

class RecipeDetailParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecipeDetailParentState();
  }
}

class RecipeDetailParentState extends State<RecipeDetailParentWidget> {
  @override
  Widget build(BuildContext context) {
    String id = ModalRoute.of(context)?.settings.arguments as String;
    RecipeDetailBloc bloc = RecipeDetailBloc(context.read<RecipeService>());

    return BlocProvider(
        create: (BuildContext context) => bloc..add(FetchRecipeDetail(id)),
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
          if (state is RecipeInitialState || state is RecipeDetailLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RecipeDetailLoaded) {
            return getDetailBody(state.recipeDetail, context);
          } else {
            return Container();
          }
        });
  }
}

Widget getDetailBody(RecipeDetail recipeDetail, BuildContext context) {
  var insets = EdgeInsets.only(left: 12, right: 12, top: 12);
  return ListView(
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
          style: context.primaryHead2(),
        ),
      ),
      Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12),
          child: Text(
            recipeDetail.sourceName,
            style: context.ascentSubtitle2()
          )),
      Padding(padding: insets, child: getTimeInfo(recipeDetail,context)),
      Padding(
          padding: insets,
          child: Text(
            "Description",
            style: context.ascentSubtitle1(),
          )),
      Padding(
          padding: insets,
          child: Html(
            data: recipeDetail.description,
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

Widget getTimeInfo(RecipeDetail recipeDetail,BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      getHorizontalTextView(
          "Servings", recipeDetail.servings.toString() + "ppl",context),
      getHorizontalTextView(
          "Cook Time", recipeDetail.readInMinute.toString() + "m",context),
      getHorizontalTextView("Score", recipeDetail.score.toString(),context),
    ],
  );
}

Widget getHorizontalTextView(String text1, String text2,BuildContext context) {
  return Column(children: <Widget>[
    Text(
      text1,
      style: context.ascentBody1(),
    ),
    Text(text2,
        style: context.ascentBody2())
  ]);
}
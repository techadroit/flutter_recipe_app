
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:recipe_flutter/blocs/actions.dart';
import 'package:recipe_flutter/blocs/events.dart';
import 'package:recipe_flutter/blocs/recipe_detail.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/model/RecipeDetail.dart';
import 'package:recipe_flutter/repository/network/RecipeApiClient.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_flutter/shared/textstyle.dart';

import '../main.dart';

class RecipeDetailParentWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return RecipeDetailParentState();
  }

}

class RecipeDetailParentState extends State<RecipeDetailParentWidget>{
RecipeDetailBloc bloc = RecipeDetailBloc(recipeRepository);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.add(FetchRecipeDetail(id:"215435"));
  }

  @override
  Widget build(BuildContext context) {
       
    return BlocProvider(create: (BuildContext context) => bloc,
    child: Scaffold(
      body:RecipeDetailWidget(),
    ));
  }  

}

class RecipeDetailWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    RecipeDetailBloc bloc = BlocProvider.of<RecipeDetailBloc>(context);
   return BlocBuilder(
     bloc: bloc,
     builder: (context,state){
     if(state is RecipeUninitialized || state is RecipeLoad){       
       return Center(child: CircularProgressIndicator());
     }else if (state is RecipeDetailState){
        return getDetailBody(state.recipeDetail);
     }
   });
  }

}

Widget getDetailBody(RecipeDetail recipeDetail){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Image.network(recipeDetail.imageUrl),
    Text(recipeDetail.title,style: titleStyle),
    Text(recipeDetail.sourceName),
    getTimeInfo(recipeDetail),
    Text("Description"),
    Html(data : recipeDetail.description)
  ],);
}

Widget getTimeInfo(RecipeDetail recipeDetail){
  return Row(
    children: <Widget>[
        getHorizontalTextView("Servings", recipeDetail.servings.toString()+"ppl"),
        getHorizontalTextView("Cook Time", recipeDetail.readInMinute.toString()+"m"),
        getHorizontalTextView("Score", recipeDetail.score.toString()),
    ],
  );
}

Widget getHorizontalTextView(String text1,String text2){
  return Column(children:<Widget>[
      Text(text1),
      Text(text2)
  ]);
}


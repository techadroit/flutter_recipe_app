import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/user_interest/user_interest_bloc.dart';
import 'package:recipe_flutter/blocs/user_interest/user_interest_event.dart';
import 'package:recipe_flutter/blocs/user_interest/user_interest_state.dart';
import 'package:recipe_flutter/main.dart';
import 'package:recipe_flutter/repository/model/Cuisine.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';

class UserInterestScreenWidget extends StatefulWidget {
  late UserInterestBloc bloc;
  final RecipeService recipeService;

  UserInterestScreenWidget(this.recipeService) {
    bloc = UserInterestBloc(recipeService);
  }

  @override
  State<StatefulWidget> createState() {
    return UserInterestScreenWidgetState(bloc);
  }
}

class UserInterestScreenWidgetState extends State<UserInterestScreenWidget> {
  late UserInterestBloc bloc;

  UserInterestScreenWidgetState(this.bloc);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<UserInterestBloc>(
          create: (context) {
            return bloc;
          },
          child: BlocListener<UserInterestBloc, UserInterestState>(
            listener: (BuildContext context, UserInterestState state) {
              if (state.cuisineSaved) {
                Navigator.of(context).popAndPushNamed(mainRoute);
              }
            },
            child: BlocBuilder<UserInterestBloc, UserInterestState>(
              bloc: bloc..add(LoadAllCuisines()),
              builder: (context, state) {
                if (state.allCuisines.isNotEmpty)
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(20),
                        child: Text("Select At'least 5 Cuisines"),),
                      ChipListWidget(state.allCuisines),
                      if (state.enableNextOptions) NextButton()
                    ],
                  );
                else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ChipListWidget extends StatelessWidget {
  final List<Cuisine> cuisineList;

  ChipListWidget(this.cuisineList);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: cuisineList.length,
        itemBuilder: (context, position) {
          Cuisine item = cuisineList[position];
          return ChipWidget(item.isSelected, item);
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: (2 / 1),
        ),
      ),
    );
  }
}

class NextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          BlocProvider.of<UserInterestBloc>(context)
              .add(SaveSelectedCuisines());
        },
        child: Text("Next"));
  }
}

class ChipWidget extends StatelessWidget {
  final bool isSelected;
  final Cuisine cuisine;

  ChipWidget(this.isSelected, this.cuisine);

  @override
  Widget build(BuildContext context) {
    UserInterestBloc bloc = BlocProvider.of(context);
    return GestureDetector(
      onTap: () {
        var newCuisine = cuisine.copyWith(isSelected: !cuisine.isSelected);
        // new Cuisine(cuisine.cuisine, isSelected: !cuisine.isSelected);
        bloc..add(CuisineSelected(newCuisine));
      },
      child: Chip(
        backgroundColor: cuisine.isSelected ? Colors.brown : Colors.grey,
        label: Text(
          cuisine.cuisine,
          style: TextStyle(fontSize: 12, fontFamily: 'RobotMono'),
        ),
      ),
    );
  }
}

import 'package:recipe_flutter/blocs/main/base_bloc.dart';
import 'package:recipe_flutter/repository/model/Cuisine.dart';

class UserInterestState extends AppState {
  var allCuisines = List<Cuisine>.empty(growable: true);
  bool enableNextOptions = false;
  bool errorMaxExceeded = false;
  bool cuisineSaved = false;

  UserInterestState.initial();

  UserInterestState.error();

  UserInterestState.selected(Cuisine cuisine, List<Cuisine> cuisineList) {
    var newCuisines = List<Cuisine>.empty(growable: true);
    cuisineList.forEach((element) {
      if (element.cuisine == cuisine.cuisine) {
        newCuisines.add(cuisine);
      } else {
        newCuisines.add(element);
      }
    });
    var count = getSelectedCount(newCuisines);
    if (count >= 5) {
      enableNextOptions = true;
    }
    allCuisines = newCuisines;
  }

  UserInterestState.cuisineSaved() {
    this.cuisineSaved = true;
  }

  int getSelectedCount(List<Cuisine> cuisineList) {
    var count = 0;
    cuisineList.forEach((element) {
      if (element.isSelected) count++;
    });
    return count;
  }

  UserInterestState.primary(this.allCuisines,
      {this.enableNextOptions = false}) {
    UserInterestState.initial();
  }

  @override
  List<Object> get props => [allCuisines, enableNextOptions, cuisineSaved];
}

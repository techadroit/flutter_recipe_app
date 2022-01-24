
import 'package:flutter_test/flutter_test.dart';
import 'package:recipe_flutter/blocs/user_interest/user_interest_state.dart';
import 'package:recipe_flutter/repository/model/Cuisine.dart';

void main(){
  test(" test cuisine equality",(){
    var cuisine1 = new Cuisine("japan",isSelected: false);
    var cuisine2 = new Cuisine("china",isSelected: true);
    var cuisine3 = new Cuisine("india",isSelected: true);

    var obj1 = UserInterestState.primary([cuisine2,cuisine1,cuisine3]);
    var newCuisine = new Cuisine(cuisine1.cuisine,isSelected: true);
    var obj2 = UserInterestState.selected(newCuisine, obj1.allCuisines);

    assert(obj1 == obj2);
  });
}
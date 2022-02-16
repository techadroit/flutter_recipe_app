import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/blocs/saved_recipes/save_recipe_bloc.dart';
import 'package:recipe_flutter/blocs/saved_recipes/save_recipe_events.dart';
import 'package:recipe_flutter/blocs/saved_recipes/save_recipe_state.dart';
import 'package:recipe_flutter/core/network/network_handler.dart';
import 'package:recipe_flutter/repository/LocalRepository.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';

import '../recipes_list/list_widget.dart';
import '../modal/list_item.dart';

class SavedRecipeWidget extends StatelessWidget {
  late SaveRecipeBloc bloc;
  final RecipeService recipeService;

  SavedRecipeWidget(this.recipeService) {
    bloc = SaveRecipeBloc(recipeService);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: bloc..add(LoadSavedRecipes()),
        builder: (context, state) {
          if (state is SavedRecipeLoaded) {
            return loadList(state.recipeList);
          } else {
            return Container();
          }
        });
  }

  Widget loadList(List<RecipeItem> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return RecipeListItemStateFullWidget(list[index]);
        });
  }
}

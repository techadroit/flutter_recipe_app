import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_flutter/core/network/network_handler.dart';
import 'package:recipe_flutter/repository/LocalRepository.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/network/remote_data_source.dart';
import 'package:recipe_flutter/repository/services/RecipeService.dart';
import 'package:recipe_flutter/repository/services/SearchRecipeService.dart';

class RepositoryWidget extends StatelessWidget {
  final Widget widget;

  RepositoryWidget(this.widget);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(providers: [
      RepositoryProvider<LocalRepository>(
        create: (context) {
          return LocalRepository();
        },
      ),RepositoryProvider<RecipeRepository>(
        create: (context) {
          final RecipeRepository recipeRepository = RecipeRepository(
            RemoteDataSource(NetworkHandler().dio),
          );
          return recipeRepository;
        },
      ),
      RepositoryProvider<RecipeService>(create: (context) {
        var recipeRepository = context.read<RecipeRepository>();
        var localRepository = context.read<LocalRepository>();
        var recipeService = RecipeService(localRepository, recipeRepository);
        return recipeService;
      }),
      RepositoryProvider<SearchRecipeService>(create: (context) {
        var recipeRepository = context.read<RecipeRepository>();
        var localRepository = context.read<LocalRepository>();
        var recipeService = SearchRecipeService(localRepository, recipeRepository);
        return recipeService;
      })
    ], child: widget);
  }
}

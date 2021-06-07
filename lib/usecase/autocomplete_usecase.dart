
import 'package:recipe_flutter/api_response/auto_complete_response.dart';
import 'package:recipe_flutter/blocs/main/either.dart';
import 'package:recipe_flutter/core/error/failures.dart';
import 'package:recipe_flutter/core/usecase/usecase.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';

class AutocompleteUsecase extends EitherUseCase<List<AutoCompleteResponse>, String> {
  RecipeRepository remoteRepository;

  AutocompleteUsecase(this.remoteRepository);

  @override
  Future<Either<Failure, List<AutoCompleteResponse>>> call(String params) async {
    try {
      var response = await remoteRepository.autoComplete(params);
      return Right(response);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

import 'package:recipe_flutter/blocs/main/either.dart';
import 'package:recipe_flutter/core/error/failures.dart';
import 'package:recipe_flutter/core/usecase/usecase.dart';
import 'package:recipe_flutter/repository/RecipeRepository.dart';
import 'package:recipe_flutter/repository/mapper/DataMapper.dart';
import 'package:recipe_flutter/repository/model/RecipeDetail.dart';

class FetchRecipeDetailUsecase extends EitherUseCase<RecipeDetail, String> {
  RecipeRepository remoteRepository;
  RecipeDetailMapper mapper;

  FetchRecipeDetailUsecase(this.remoteRepository, this.mapper);

  @override
  Future<Either<Failure, RecipeDetail>> call(String params) async {
    try {
      var response = await remoteRepository.getRecipeInformation(params);
      return Right(mapper.mapTo(response));
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

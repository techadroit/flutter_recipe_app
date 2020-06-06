import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failures.dart';

abstract class Usecase{}

abstract class EitherUseCase<Type, Params> extends Usecase{
  Future<Either<Failure, Type>> call(Params params);
}

abstract class ResultUsecase<Type,Params> extends Usecase{
  Future<Type> call(Params params);
}

abstract class CompletableUsecase<Params> extends Usecase{
  Future<Void> call(Params params);
}

/// represent no parameter supply to usecases
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

/// represent empty result
class Empty extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
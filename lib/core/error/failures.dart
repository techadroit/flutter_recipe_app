import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class NoResultFound extends Failure{

}

class Error extends Equatable{
  Failure failure;
  Error(this.failure);

  @override
  List<Object?> get props => [failure];
}

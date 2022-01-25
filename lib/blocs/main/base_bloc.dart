
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseBloc<E extends AppEvent,S extends AppState>
    extends Bloc<E,S>{

  BaseBloc(S initialState) : super(initialState);
}

abstract class AppState extends Equatable{
  @override
  List<Object?> get props => [];
}

abstract class AppEvent extends Equatable{
  @override
  List<Object?> get props => [];
}
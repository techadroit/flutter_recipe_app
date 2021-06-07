//
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:recipe_flutter/blocs/main/base_bloc.dart';
//
// import '../events.dart';
// import '../state.dart';
//
// class MainBloc extends BaseBloc<RecipeEvent,RecipeState>{
//
//   MainBloc() : super(BottomNavigationState(0));
//
//   @override
//   Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
//     if(event is BottomNavigationEvent){
//       yield BottomNavigationState(event.index);
//     }
//   }
//
// }

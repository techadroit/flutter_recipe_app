
import 'package:flutter_bloc/flutter_bloc.dart';

import 'actions.dart';
import 'events.dart';

class MainBloc extends Bloc<RecipeAction,RecipeEvent>{
  @override
  RecipeEvent get initialState => BottomNavigationEvent(0);

  @override
  Stream<RecipeEvent> mapEventToState(RecipeAction event) async* {
    if(event is BottomNavigationAction){
      yield BottomNavigationEvent(event.index);
    }
  }

}

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
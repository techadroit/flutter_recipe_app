
import 'package:flutter_bloc/flutter_bloc.dart';

import 'actions.dart';
import 'events.dart';

class MainBloc extends Bloc<RecipeEvent,RecipeState>{
  @override
  RecipeState get initialState => BottomNavigationState(0);

  @override
  Stream<RecipeState> mapEventToState(RecipeEvent event) async* {
    if(event is BottomNavigationEvent){
      yield BottomNavigationState(event.index);
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
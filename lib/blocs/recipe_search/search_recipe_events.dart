

import 'package:recipe_flutter/blocs/main/base_bloc.dart';

class SearchEvent extends AppEvent {
  String keyword;

  SearchEvent(this.keyword);
}

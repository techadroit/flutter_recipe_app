import 'package:equatable/equatable.dart';

class Cuisine extends Equatable {
  String cuisine;
  bool isSelected;

  Cuisine(this.cuisine, {this.isSelected = false});

  @override
  List<Object?> get props => [cuisine, isSelected];

  Cuisine copyWith({String? cuisine, bool? isSelected}) {
    return Cuisine(cuisine ?? this.cuisine,
        isSelected: isSelected ?? this.isSelected);
  }
}

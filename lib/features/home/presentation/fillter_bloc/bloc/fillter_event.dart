part of 'fillter_bloc.dart';

sealed class FillterEvent extends Equatable {
  const FillterEvent();

  @override
  List<Object> get props => [];
}

class AddTypeFillter extends FillterEvent {
  final String value;

  const AddTypeFillter(this.value);

  @override
  List<Object> get props => [value];
}

class ClearTypeFillter extends FillterEvent {
  const ClearTypeFillter();

  @override
  List<Object> get props => [];
}

class AddLocationFillter extends FillterEvent {
  final String value;

  const AddLocationFillter(this.value);

  @override
  List<Object> get props => [value];
}

class ClearLocationFillter extends FillterEvent {
  const ClearLocationFillter();

  @override
  List<Object> get props => [];
}

class AddFoodFillter extends FillterEvent {
  final String value;

  const AddFoodFillter(this.value);

  @override
  List<Object> get props => [value];
}

class ClearFoodFillter extends FillterEvent {
  final String value;
  const ClearFoodFillter(this.value);

  @override
  List<Object> get props => [value];
}

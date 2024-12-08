part of 'fillter_bloc.dart';

class FillterState extends Equatable {
  final Set<String> typeFillter;
  final Set<String> locationFillter;
  final Set<String> foodFillter;

  const FillterState(
      {this.locationFillter = const {},
      this.foodFillter = const {},
      this.typeFillter = const {}});

  FillterState copyWith(
      {Set<String>? typeFillter,
      final Set<String>? locationFillter,
      Set<String>? foodFillter}) {
    return FillterState(
      typeFillter: typeFillter ?? this.typeFillter,
      locationFillter: locationFillter ?? this.locationFillter,
      foodFillter: foodFillter ?? this.foodFillter,
    );
  }

  @override
  List<Object> get props => [typeFillter, locationFillter, foodFillter];
}

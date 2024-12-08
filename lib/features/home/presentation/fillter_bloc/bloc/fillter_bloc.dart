import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'fillter_event.dart';
part 'fillter_state.dart';

class FillterBloc extends Bloc<FillterEvent, FillterState> {
  FillterBloc() : super(const FillterState()) {
    on<AddTypeFillter>((event, emit) {
      emit(state.copyWith(
        typeFillter: Set.from(state.typeFillter)..add(event.value),
      ));
    });

    on<ClearTypeFillter>((event, emit) {
      emit(state.copyWith(
        typeFillter: Set.from(state.typeFillter)..clear(),
      ));
    });

    on<AddLocationFillter>((event, emit) {
      emit(state.copyWith(
        locationFillter: Set.from(state.locationFillter)..add(event.value),
      ));
    });

    on<ClearLocationFillter>((event, emit) {
      emit(state.copyWith(
        locationFillter: Set.from(state.locationFillter)..clear(),
      ));
    });

    on<AddFoodFillter>((event, emit) {
      emit(state.copyWith(
        foodFillter: Set.from(state.foodFillter)..add(event.value),
      ));
    });

    on<ClearFoodFillter>((event, emit) {
      emit(state.copyWith(
        foodFillter: Set.from(state.foodFillter)..remove(event.value),
      ));
    });
  }
}

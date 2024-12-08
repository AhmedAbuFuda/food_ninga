import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_ninja/features/home/model/restaurant_model.dart';
import 'package:food_ninja/features/home/model/restaurant_repo.dart';

part 'restaurant_event.dart';
part 'restaurant_state.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  final RestaurantRepo restaurantRepo;
  RestaurantBloc(this.restaurantRepo) : super(RestaurantInitial()) {
    on<FetchNearestRestaurants>(_onFetchNearestRestaurants);
  }

  Future<void> _onFetchNearestRestaurants(
      FetchNearestRestaurants event, Emitter<RestaurantState> emit) async {
    emit(RestaurantLoading());
    try {
      final restaurants = await restaurantRepo.getNearestRestaurants();
      emit(RestaurantLoaded(restaurants));
    } catch (e) {
      emit(RestaurantError(e.toString()));
    }
  }
}

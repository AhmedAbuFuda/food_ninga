import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<FetchLocation>(_onFetchLocation);
  }

  Future<void> _onFetchLocation(
      FetchLocation event, Emitter<LocationState> emit) async {
    emit(LocationLoading());
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        await Geolocator.openLocationSettings();
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.deniedForever) {
        emit(const LocationError(
            "Location permissions are permanently denied."));
        return;
      }

      final position = await Geolocator.getCurrentPosition();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setDouble('latitude', position.latitude);
      await prefs.setDouble('longitude', position.longitude);
      emit(LocationLoaded(position));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}

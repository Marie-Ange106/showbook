import 'package:bloc/bloc.dart';
import 'package:showbook/location/data/location_model.dart';
import 'package:showbook/location/data/location_repository.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepository location;
  LocationCubit({
    required this.location,
  }) : super(LocationState());

  getLocation() async {
    emit(
      state.copyWith(
        isLoadingLocation: true,
        sucessLoadingLocation: false,
        errorLoadingLocation: false,
      ),
    );
    try {
      final locations = await location.getLocation();
      emit(
        state.copyWith(
          locations: locations,
          isLoadingLocation: false,
          sucessLoadingLocation: true,
          errorLoadingLocation: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingLocation: false,
          sucessLoadingLocation: false,
          errorLoadingLocation: true,
          message: e.toString(),
        ),
      );
    }
  }
}

part of 'location_cubit.dart';

class LocationState {
  List<LocationModel>? locations;
  bool isLoadingLocation;
  bool sucessLoadingLocation;
  bool errorLoadingLocation;

  String? message;

  LocationState({
    this.locations,
    this.isLoadingLocation = false,
    this.sucessLoadingLocation = false,
    this.errorLoadingLocation = false,
    this.message,
  });

  LocationState copyWith({
    List<LocationModel>? locations,
    bool? isLoadingLocation,
    bool? sucessLoadingLocation,
    bool? errorLoadingLocation,
    String? message,
  }) {
    return LocationState(
      locations: locations ?? this.locations,
      isLoadingLocation: isLoadingLocation ?? this.isLoadingLocation,
      sucessLoadingLocation: sucessLoadingLocation ?? this.sucessLoadingLocation,
      errorLoadingLocation: errorLoadingLocation ?? this.errorLoadingLocation,
      message: message ?? this.message,
    );
  }
}

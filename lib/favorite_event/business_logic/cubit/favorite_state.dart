part of 'favorite_cubit.dart';

class FavoriteState {
  List<EventModel> favoriteEvents;
  int totalEvent;
  FavoriteState({
    required this.favoriteEvents,
    required this.totalEvent,
  });
  FavoriteState copyWith({
    List<EventModel>? favoriteEvents,
    int? totalEvent,
  }) {
    return FavoriteState(
      favoriteEvents: favoriteEvents ?? this.favoriteEvents,
      totalEvent: totalEvent ?? this.totalEvent,
    );
  }
}

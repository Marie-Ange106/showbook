import 'package:bloc/bloc.dart';
import 'package:showbook/event/data/models/event_model.dart';


part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit()
      : super(
          FavoriteState(
            favoriteEvents: [],
            totalEvent: 0,
          ),
        );

   addEventInFavorite(EventModel profil) {
    List<EventModel> events = [...state.favoriteEvents];
    events.add(profil);
    emit(
      state.copyWith(
        favoriteEvents: events,
        totalEvent: events.length,
      ),
    );
  }

  removeEventInFavorite(EventModel event) {
    List<EventModel> events = [...state.favoriteEvents];
    events.remove(event);
    emit(
      state.copyWith(
        favoriteEvents: events,
        totalEvent: events.length,
      ),
    );
  } 

  
  
      
}

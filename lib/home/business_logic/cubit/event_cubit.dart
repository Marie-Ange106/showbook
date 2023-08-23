import 'package:bloc/bloc.dart';
import 'package:showbook/home/data/models/event_model.dart';
import 'package:showbook/home/data/repositories/event_repository.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final EventRepository eventRepository;

  EventCubit({
    required this.eventRepository,
  }) : super(EventState());

  getEvent({
    String? category,
    String? date,
    String? location,
    String? keyword,
    int? price,
  }) async {
    try {
      emit(state.copyWith(
        isLoadingEvent: true,
        sucessLoadingEvent: false,
        errorLoadingEvent: false,
      ));
      var events = await eventRepository.getEvent(
        category:category,
        date:date,
        location:location,
        keyword:keyword,
        price:price,
      );
      // print(events);
      emit(state.copyWith(
        events: events,
        isLoadingEvent: false,
        sucessLoadingEvent: true,
        errorLoadingEvent: false,
      ));
    } catch (e) {
      // print(e);

      emit(state.copyWith(
        isLoadingEvent: false,
        sucessLoadingEvent: false,
        errorLoadingEvent: true,
        message: e.toString(),
      ));
    }
  }
}

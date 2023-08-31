part of 'event_cubit.dart';


class EventState {
  List<EventModel>? events;
  bool isLoadingEvent;
  bool sucessLoadingEvent;
  bool errorLoadingEvent;



  String? message;

  EventState({
    this.events,
    this.isLoadingEvent = false,
    this.sucessLoadingEvent = false,
    this.errorLoadingEvent = false,
    this.message,
  });

  EventState copyWith({
    List<EventModel>? events,
    bool? isLoadingEvent,
    bool? sucessLoadingEvent,
    bool? errorLoadingEvent,
    String? message,
  }){
     return EventState(
      events : events ?? this.events,
      isLoadingEvent : isLoadingEvent ?? this.isLoadingEvent,
      sucessLoadingEvent : sucessLoadingEvent ?? this.sucessLoadingEvent,
      errorLoadingEvent : errorLoadingEvent ?? this.errorLoadingEvent,
      message : message ?? this.message,
     );
  }
}



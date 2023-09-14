part of 'event_cubit.dart';

class EventState {
  List<EventModel>? events;
  bool isLoadingEvent;
  bool sucessLoadingEvent;
  bool errorLoadingEvent;
  //
  String? message;
  //
  LikeModel? like;
  String? eventId;
  bool isLikedEvent;
  bool isUnlikedEvent;
  //
  EventModel? event;
  bool isSendingData;
  bool sucessSendingData;
  bool errorSendingData;

  EventState({
    this.events,
    this.isLoadingEvent = false,
    this.sucessLoadingEvent = false,
    this.errorLoadingEvent = false,
    //
    this.message,
    //
    this.like,
    this.eventId,
    this.isLikedEvent = false,
    this.isUnlikedEvent = false,
    //
    this.event,
    this.isSendingData = false,
    this.sucessSendingData = false,
    this.errorSendingData = false,
  });

  EventState copyWith({
    List<EventModel>? events,
    bool? isLoadingEvent,
    bool? sucessLoadingEvent,
    bool? errorLoadingEvent,
    //
    String? message,
    //
    String? eventId,
    LikeModel? like,
    bool? isLikedEvent,
    bool? isUnlikedEvent,
    //
    EventModel? event,
    bool? isSendingData,
    bool? sucessSendingData,
    bool? errorSendingData,
  }) {
    return EventState(
      events: events ?? this.events,
      isLoadingEvent: isLoadingEvent ?? this.isLoadingEvent,
      sucessLoadingEvent: sucessLoadingEvent ?? this.sucessLoadingEvent,
      errorLoadingEvent: errorLoadingEvent ?? this.errorLoadingEvent,
      //
      message: message ?? this.message,
      //
      like: like ?? this.like,
      eventId: eventId ?? this.eventId,
      isLikedEvent: isLikedEvent ?? this.isLikedEvent,
      isUnlikedEvent: isUnlikedEvent ?? this.isUnlikedEvent,
      //
      event: event?? this.event,
      isSendingData: isSendingData ?? this.isSendingData,
      sucessSendingData: sucessSendingData ?? this.sucessSendingData,
      errorSendingData: errorSendingData ?? this.errorSendingData,
    );
  }
}

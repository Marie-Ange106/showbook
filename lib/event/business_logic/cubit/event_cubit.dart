import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:showbook/event/data/models/event_model.dart';
import 'package:showbook/event/data/repositories/event_repository.dart';

import '../../data/models/like_moddel.dart';

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
        category: category,
        date: date,
        location: location,
        keyword: keyword,
        price: price,
      );
      // print(events);
      emit(
        state.copyWith(
          events: events,
          isLoadingEvent: false,
          sucessLoadingEvent: true,
          errorLoadingEvent: false,
        ),
      );
    } catch (e) {
      // print(e);

      emit(
        state.copyWith(
          isLoadingEvent: false,
          sucessLoadingEvent: false,
          errorLoadingEvent: true,
          message: e.toString(),
        ),
      );
    }
  }

  likeEvent({required int id}) async {
    try {
      var like = await eventRepository.likedEvent(eventId: id);
      emit(
        state.copyWith(
          like: like,
          isLikedEvent: false,
          isUnlikedEvent: true,
        ),
      );
      emit(
        state.copyWith(
          isLikedEvent: true,
          isUnlikedEvent: false,
        ),
      );
    } catch (e) {}
  }

  addEvent({
    required String title,
    required String description,
    required File image,
    required int numberSpace,
    required DateTime startDate,
    String? endDate,
    int? price,
    required int organiserId,
    required int locationId,
    required int categories,
    int? guests,
  }) async {
    try {
      emit(
        state.copyWith(
          isSendingData: true,
          sucessSendingData: false,
          errorSendingData: false,
        ),
      );
      var event = await eventRepository.addEvent(
        title: title,
        description: description,
        image: image,
        numberSpace: numberSpace,
        startDate: startDate,
        endDate: endDate,
        organiserId: organiserId,
        locationId: locationId,
        categories: categories,
      );
      emit(
        state.copyWith(
          event: event,
          isSendingData: false,
          sucessSendingData: true,
          errorSendingData: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSendingData: false,
          sucessSendingData: false,
          errorSendingData: true,
          message: e.toString(),
        ),
      );
    }
  }
}

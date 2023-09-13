import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../data/comment_model.dart';
import '../../data/comment_repository.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  final CommentRepository comment;

  final _commentController = StreamController<List<CommentModel>>();

  Stream<List<CommentModel>> get commentStream => _commentController.stream;

  CommentCubit({required this.comment}) : super(CommentState());

  getCommentByEvent({required int eventId}) async {
    try {
      emit(
        state.copyWith(
          isLoadingComment: true,
          sucessLoadingComment: false,
          errorLoadingComment: false,
        ),
      );
      var comments = await comment.getCommentByEvent(eventId: eventId);
      _commentController.add(comments);
      emit(
        state.copyWith(
          isLoadingComment: false,
          sucessLoadingComment: true,
          errorLoadingComment: false,
          comments: comments,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingComment: false,
          sucessLoadingComment: true,
          errorLoadingComment: false,
          message: e.toString(),
        ),
      );
    }
  }

  addCommentForEvent({
    required int eventId,
    required String content,
  }) async {
    try {
      emit(
        state.copyWith(
          isSendingComment: true,
          sucessSendingComment: false,
          errorSendingComment: false,
        ),
      );
      var currentComment = await comment.addCommentForEvent(
        eventId: eventId,
        content: content,
      );
      _commentController.add(currentComment as List<CommentModel>);
      emit(
        state.copyWith(
          isSendingComment: false,
          sucessSendingComment: true,
          errorSendingComment: false,
          comment: currentComment,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSendingComment: false,
          sucessSendingComment: false,
          errorSendingComment: true,
          message: e.toString(),
        ),
      );
    }
  }
}

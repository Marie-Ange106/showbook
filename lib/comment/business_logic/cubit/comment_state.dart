part of 'comment_cubit.dart';

class CommentState {
  List<CommentModel>? comments;
  bool isLoadingComment;
  bool sucessLoadingComment;
  bool errorLoadingComment;
  //
  String? message;
  //
  CommentModel? comment;
  bool isSendingComment;
  bool sucessSendingComment;
  bool errorSendingComment;

  CommentState({
    this.comments,
    this.isLoadingComment = false,
    this.sucessLoadingComment = false,
    this.errorLoadingComment = false,
    //
    this.message,
    //
    this.comment,
    this.isSendingComment = false,
    this.sucessSendingComment = false,
    this.errorSendingComment = false,
  });

  CommentState copyWith({
    List<CommentModel>? comments,
    bool? isLoadingComment,
    bool? sucessLoadingComment,
    bool? errorLoadingComment,
    //
    String? message,
    //
    CommentModel? comment,
    bool? isSendingComment,
    bool? sucessSendingComment,
    bool? errorSendingComment,
  }) {
    return CommentState(
      comments: comments ?? this.comments,
      isLoadingComment: isLoadingComment ?? this.isLoadingComment,
      sucessLoadingComment: sucessLoadingComment ?? this.sucessLoadingComment,
      errorLoadingComment: errorLoadingComment ?? this.errorLoadingComment,
      //
      message: message ?? this.message,
      //
      comment: comment ?? this.comment,
      isSendingComment: isSendingComment ?? this.isSendingComment,
      sucessSendingComment: sucessSendingComment ?? this.sucessSendingComment,
      errorSendingComment: errorSendingComment ?? this.errorSendingComment,
    );
  }
}

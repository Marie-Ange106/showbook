import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:showbook/comment/data/comment_model.dart';

class CommentRepository {
  final Dio dio;

  CommentRepository({required this.dio});

  Future<List<CommentModel>> getCommentByEvent({
    required int eventId,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Response response = await dio.get(
      '/api/showbook/comment/$eventId',
      options: Options(headers: {
        'Authorization': 'Bearer $token',
      }),
    );

    var data = response.data["comments"];
    // print(data);
    List<CommentModel> comments = [];
    for (var comment in data) {
      comments.add(CommentModel.fromJson(comment));
    }
    print(comments);
    return comments;
  }

  Future<CommentModel> addCommentForEvent({
    required int eventId,
    required String content,
  }) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    Response response = await dio.post(
      '/api/showbook/comment/$eventId',
      data: {
        'content': content,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    var data = response.data["comment"];
    print(data);
    return CommentModel.fromJson(data);
  }
}

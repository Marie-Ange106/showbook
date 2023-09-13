import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/comment/business_logic/cubit/comment_cubit.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/shared/utils/app_colors.dart';

class CommentBottomSheet extends StatefulWidget {
  final int eventId;
  const CommentBottomSheet({
    required this.eventId,
    super.key,
  });

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  late TextEditingController _commentController;
  bool _inputNonVide = false;
  @override
  void initState() {
    _commentController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CommentCubit, CommentState>(
        // bloc: getIt.get<CommentCubit>()
        //   ..getCommentByEvent(eventId: widget.eventId),
        builder: (context, state) {
          if (state.isLoadingComment) {
            const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state.comments?.isEmpty ?? true) {
            const Center(
              child: Text(
                'No comments',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            );
          }
          var comments = state.comments;
          return StreamBuilder(
            stream: context.read<CommentCubit>().commentStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return Container(
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Comments',
                            style: TextStyle(
                              fontSize: 18,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: AppColors.primary,
                    ),
                    // container of coments
                    Container(
                      height: 500,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: state.comments!.length,
                          itemBuilder: (context, index) {
                            var comment = comments![index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CircleAvatar(
                                    radius: 25,
                                    backgroundColor:
                                        Color.fromARGB(255, 232, 231, 231),
                                    child: Icon(
                                      Icons.person,
                                      size: 25,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        comment.user.name,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: AppColors.tertiary,
                                        ),
                                      ),
                                      Container(
                                        width: 300,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              comment.content,
                                              softWrap: true,
                                              style: const TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Text(comment.createdAt.toString())
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomSheet: BottomAppBar(
        elevation: 1,
        color: AppColors.white,
        child: Form(
          child: TextFormField(
            controller: _commentController,
            decoration: InputDecoration(
              hintText: 'Enter a comment',
              hintStyle: const TextStyle(
                color: AppColors.tertiary,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              filled: true,
              fillColor: const Color.fromARGB(255, 232, 231, 231),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              suffixIcon: _inputNonVide
                  ? IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.primary,
                      ),
                      onPressed: () {
                        getIt.get<CommentCubit>().addCommentForEvent(
                              eventId: widget.eventId,
                              content: _commentController.text,
                            );
                        _commentController.clear();
                      },
                    )
                  : null,
            ),
            onChanged: (value) {
              setState(() {
                _inputNonVide = value.isNotEmpty;
              });
            },
          ),
        ),
      ),
    );
  }
}

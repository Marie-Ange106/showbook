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
  final _commentFocusNode = FocusNode();

  @override
  void initState() {
    _commentController = TextEditingController();
    context.read<CommentCubit>().commentStream;
    super.initState();
  }

  // @override
  // void dispose() {
  //   context.read<CommentCubit>().closeStream();
  //   // getIt.get<CommentCubit>().closeStream();
  //   // fermer le flux
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CommentCubit, CommentState>(
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
                      padding: EdgeInsets.only(top: 15),
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
                              padding:
                                  const EdgeInsets.only(bottom: 35, left: 5),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
            focusNode: _commentFocusNode,
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
              //  verifier si il y'a une valeur entrer et afficher le bouton d'envoie ou pas
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
                        _commentFocusNode
                            .unfocus(); // désactiver le clavier apres l'envoie du comment
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

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:showbook/event/business_logic/cubit/event_cubit.dart';
// import 'package:showbook/favorite_event/business_logic/cubit/favorite_cubit.dart';

// import '../../auth/data/user_model.dart';
// import '../../event/data/models/event_model.dart';
// import '../../service_locator.dart';
// import '../utils/app_colors.dart';

// class ButtonLikeWidget extends StatefulWidget {
//   final EventModel eventModel;
//   final UserModel? user;

//   const ButtonLikeWidget({
//     required this.eventModel,
//     required this.user,
//     super.key,
//   });

//   @override
//   State<ButtonLikeWidget> createState() => _ButtonLikeWidgetState();
// }

// class _ButtonLikeWidgetState extends State<ButtonLikeWidget> {
//   bool _isLiked = true;
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<EventCubit, EventState>(
//       builder: (context, state) {
//         return Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Container(
//                 height: 30,
//                 width: 30,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(30),
//                   color: const Color.fromARGB(255, 177, 177, 177),
//                 ),
//                 child: Center(
//                   child: IconButton(
//                     onPressed: () {
//                       if (widget.user != null) {
//                         if (widget.user!.isLikeBy(
//                           userId: widget.user!.id,
//                         )) {
//                           widget.user!.removeLike(
//                               eventId: widget.eventModel.id,
//                               uId: widget.user!.id);
//                           getIt
//                               .get<EventCubit>()
//                               .likeEvent(id: widget.eventModel.id);
//                           getIt
//                               .get<FavoriteCubit>()
//                               .removeEventInFavorite(widget.eventModel);
//                         } else {
//                           widget.user!.addLike(
//                               user: widget.user!, event: widget.eventModel);
//                           getIt
//                               .get<EventCubit>()
//                               .likeEvent(id: widget.eventModel.id);
//                           getIt
//                               .get<FavoriteCubit>()
//                               .addEventInFavorite(widget.eventModel);
//                         }
//                       }
//                     },
//                     icon: widget.user != null
//                         ? widget.user!.isLikeBy(userId: widget.user!.id) ==
//                                 false
//                             ? const Icon(
//                                 Icons.favorite,
//                                 color: AppColors.primary,
//                                 size: 16,
//                               )
//                             : const Icon(
//                                 Icons.favorite_border_outlined,
//                                 color: AppColors.secondary,
//                                 size: 16,
//                               )
//                         : const Icon(
//                             Icons.favorite,
//                             color: AppColors.primary,
//                             size: 16,
//                           ),
//                   ),
//                 )),
//           ],
//         );
//       },
//     );
//   }
// }

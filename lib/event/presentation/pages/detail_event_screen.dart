import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/auth/business_logic/cubit/auth_cubit.dart';
import 'package:showbook/event/data/models/event_model.dart';
import 'package:showbook/favorite_event/business_logic/cubit/favorite_cubit.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/utils/parse_date.dart';
import 'package:showbook/shared/widgets/button_widget.dart';

import '../../../comment/business_logic/cubit/comment_cubit.dart';
import '../../../comment/presentation/pages/comment_bottomSheet.dart';
import '../../../profil/presentation/widgets/profil_item_widget.dart';
import '../../../service_locator.dart';
import '../../../shared/routes/routes.gr.dart';
import '../../business_logic/cubit/event_cubit.dart';

@RoutePage()
class DetailEventScreen extends StatefulWidget {
  final EventModel event;
  const DetailEventScreen({super.key, required this.event});

  @override
  State<DetailEventScreen> createState() => _DetailEventScreenState();
}

class _DetailEventScreenState extends State<DetailEventScreen> {
  bool _isExpanded = false;
  bool _isLiked = false;

  bool _isBottomSheetOpen = false;

  void _openBottomSheet(BuildContext context) {
    setState(() {
      _isBottomSheetOpen = true;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: 600,
            child: CommentBottomSheet(
              eventId: widget.event.id,
            ),
          ),
        );
      },
    ).whenComplete(() {
      setState(() {
        _isBottomSheetOpen = false;
      });
    });
  }

  Future<void> _showLoginDialog(BuildContext context, String text) async {
    return showDialog<void>(
      context: context,
      barrierDismissible:
          false, // empêche l'utilisateur de fermer la boîte de dialogue en cliquant à l'extérieur
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Log in'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(text),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text(
                'Login',
                style: TextStyle(
                  color: AppColors.primary,
                ),
              ),
              onPressed: () {
                context.router.push(const LoginRoute());
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state.sucessTcheckUser) {
          // recuperer les commentaires de chaque event
          getIt.get<CommentCubit>().getCommentByEvent(eventId: widget.event.id);
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Détail '),
            actions: [
              SizedBox(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (state.errorTcheckUser) {
                        _showLoginDialog(
                          context,
                          'You must login to like event',
                        ); // affiche la boîte de dialogue de connexion
                      } else if (state.sucessTcheckUser) {
                        getIt.get<EventCubit>().likeEvent(id: widget.event.id);
                        getIt.get<FavoriteCubit>().addEventInFavorite(
                              widget.event,
                            );
                        _isLiked = !_isLiked;
                      }
                    });
                  },
                  icon: _isLiked
                      ? const Icon(
                          Icons.favorite,
                          color: AppColors.primary,
                        )
                      : const Icon(Icons.favorite_border_outlined),
                ),
              ),
              IconButton(
                onPressed: () {
                  if (!_isBottomSheetOpen && state.sucessTcheckUser ||
                      !_isBottomSheetOpen && state.sucessLoginging ||
                      !_isBottomSheetOpen && state.sucessRegistering) {
                    _openBottomSheet(context);
                  } else if (state.errorTcheckUser) {
                    _showLoginDialog(
                      context,
                      'You must login to comment event',
                    ); // affiche la boîte de dialogue de connexion
                  }
                },
                icon: const Icon(Icons.messenger_outline_rounded),
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'Share',
                    child: Row(
                      children: [
                        Icon(Icons.share),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Share'),
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'Contact organizer',
                    child: Row(
                      children: [
                        Icon(Icons.contact_phone),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Contact organizer'),
                      ],
                    ),
                  ),
                ],
                onSelected: (String value) {
                  // Faire quelque chose lorsque l'un des éléments est sélectionné
                },
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 230,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            'https://nvxubcejz.preview.infomaniak.website/storage/${widget.event.pathImage}',
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // title
                  Text(
                    widget.event.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: AppColors.primary,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Date',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                Convertion().dateTime(widget.event.startDate),
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: AppColors.primary,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Location',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.event.location.name,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  // about event
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'About this event',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Text(
                  //   widget.event.description,
                  //   style: const TextStyle(
                  //     fontSize: 14,
                  //   ),
                  // ),
                  Text(
                    widget.event.description,
                    maxLines: _isExpanded ? null : 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (!_isExpanded)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isExpanded = true;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "Voir plus",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  if (_isExpanded)
                    Text(
                      widget.event.description,
                    ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = false;
                      });
                    },
                    child: !_isExpanded
                        ? Container()
                        : const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              "Voir moins",
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  // organizer
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Organizer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ProfilWidget(
                          profilModel: widget.event.organizer!,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Event added by Marie-Ange',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.event.price == null)
                  const Text(
                    'Free',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                else
                  Text(
                    '${widget.event.price.toString()} FCFA',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                const ButtonWidget(
                  text: 'Reserve a ticket',
                  textColor: AppColors.white,
                  borderColor: AppColors.secondary,
                  bgColor: AppColors.secondary,
                  height: 40,
                  width: 160,
                  fontSize: 14,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

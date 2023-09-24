import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/event/data/models/event_model.dart';
import 'package:showbook/event/presentation/widgets/event_item_widget.dart';
import 'package:showbook/favorite_event/business_logic/cubit/favorite_cubit.dart';
import 'package:showbook/shared/routes/routes.gr.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/widgets/vertical_menu.dart';

@RoutePage()
class FavoriteEVentScreen extends StatefulWidget {
  const FavoriteEVentScreen({super.key});

  @override
  State<FavoriteEVentScreen> createState() => _MyEventScreenState();
}

class _MyEventScreenState extends State<FavoriteEVentScreen> {
  Future<void> _refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: AppColors.white,
        title: const Text(
          'Favorite events',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      drawer: const VerticalMenuScreen(),
      body: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state.favoriteEvents.isEmpty) {
            return const Center(
              child: Card(
                  color: AppColors.white,
                  child: SizedBox(
                    height: 300,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'No likes',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Put a like on an event and find it later.',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: const ButtonWidget(
                          //     text: 'See events',
                          //     textColor: AppColors.white,
                          //     bgColor: AppColors.primary,
                          //     borderColor: AppColors.primary,
                          //     height: 40,
                          //     width: 130,
                          //     fontSize: 16,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  )),
            );
          }
          return RefreshIndicator(
            onRefresh: _refresh,
            child: ListView.builder(
              itemCount: state.favoriteEvents.length,
              itemBuilder: (context, index) {
                // if (state.profilFollow.isEmpty) {
                //   return Text('Aucun profil suivi!');
                // }
                EventModel event = state.favoriteEvents[index];
                // FollowedListScreen.totalProfil = state.profilFollow.length;
                return Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(
                        DetailEventRoute(event: event),
                      );
                    },
                    child: EventItemWidget(
                      eventModel: event,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

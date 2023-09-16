import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/event/data/models/event_model.dart';
import 'package:showbook/event/presentation/widgets/event_item_widget.dart';
import 'package:showbook/favorite_event/business_logic/cubit/favorite_cubit.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/widgets/vertical_menu.dart';

@RoutePage()
class FavoriteEVentScreen extends StatefulWidget {
  const FavoriteEVentScreen({super.key});

  @override
  State<FavoriteEVentScreen> createState() => _MyEventScreenState();
}

class _MyEventScreenState extends State<FavoriteEVentScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
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
          body: ListView.builder(
            itemCount: state.favoriteEvents.length,
            itemBuilder: (context, index) {
              // if (state.profilFollow.isEmpty) {
              //   return Text('Aucun profil suivi!');
              // }
              EventModel event = state.favoriteEvents[index];
              // FollowedListScreen.totalProfil = state.profilFollow.length;
              return Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                child: EventItemWidget(
                  eventModel: event,
                ),
              );
            },
          ),
        );
      },
    );
  }
}

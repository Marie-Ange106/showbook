import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:showbook/profil/data/models/profil_model.dart';
import 'package:showbook/event/presentation/widgets/event_organized_widget.dart';

@RoutePage()
class Coming extends StatelessWidget {
  final ProfilModel profilModel;
  const Coming({
    super.key,
    required this.profilModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // const Text('Organized events'),
        // SizedBox(
        //   height: 100,
        //   child: EventInvitedWidget(
        //     eventInvited: profilModel.eventsInvited,
        //     state: 'Future',
        //   ),
        // ),
        // const Text(
        //   'Guest events',
        // ),
        SizedBox(
          height: 100,
          child: EventOrganizedWidget(
            eventOrganized: profilModel.eventsOrganized,
            state: 'Future',
          ),
        )
      ],
    );
  }
}

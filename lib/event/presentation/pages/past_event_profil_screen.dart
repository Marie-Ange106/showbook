import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/event_organized_widget.dart';
import '../../../profil/data/models/profil_model.dart';

@RoutePage()
class PastEventProfilScreen extends StatelessWidget {
  final ProfilModel profilModel;
  const PastEventProfilScreen({
    super.key,
    required this.profilModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // const Text(
        //   'Organized events'
        // ),
        // SizedBox(
        //   height: 100,
        //   child: EventInvitedWidget(
        //     eventInvited: profilModel.eventsInvited,
        //     state: 'Past',
        //   ),
        // ),
        // const Text(
        //   'Organized events'
        // ),
        SizedBox(
          height: 100,
          child: EventOrganizedWidget(
            eventOrganized: profilModel.eventsOrganized,
            state: 'Past',
          ),
        ),
      ],
    );
  }
}

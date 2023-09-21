import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:showbook/profil/data/models/profil_model.dart';
import 'package:showbook/shared/routes/routes.gr.dart';

import '../../../shared/utils/app_colors.dart';
import '../../../shared/utils/parse_date.dart';
import '../../data/models/event_model.dart';

@RoutePage()
class Coming extends StatelessWidget {
  final ProfilModel profilModel;
  const Coming({
    super.key,
    required this.profilModel,
  });

  @override
  Widget build(BuildContext context) {
    List<EventModel> events = [];
    for (var event in profilModel.eventsOrganized!) {
      if (event.state == 'future') {
        events.add(event);
      }
    }
    for (var event in profilModel.eventsInvited!) {
      if (event.state == 'future') {
        events.add(event);
      }
    }

    if (events.isNotEmpty) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return GestureDetector(
                onTap: () {
                  context.router.push(DetailEventRoute(event: event));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Convertion().dateTime(event.startDate),
                            style: const TextStyle(
                                fontSize: 14, color: AppColors.primary),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                event.location.name,
                                style: const TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const Divider(
                        height: 0.25,
                        color: Color.fromARGB(71, 112, 112, 112),
                      ),
                    ],
                  ),
                ),
              );
            },
          ));
    }
    return const Center(
      child: Text(
        'No Future event(s)',
      ),
    );
  }
}

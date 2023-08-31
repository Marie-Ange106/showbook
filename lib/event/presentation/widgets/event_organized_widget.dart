import 'package:flutter/material.dart';
import 'package:showbook/event/data/models/event_model.dart';

import '../../../shared/utils/app_colors.dart';

class EventOrganizedWidget extends StatelessWidget {
  final List<EventModel>? eventOrganized;
  final String state;
  const EventOrganizedWidget({
    super.key,
    required this.eventOrganized,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: eventOrganized!.isNotEmpty
          ? ListView.builder(
              itemCount: eventOrganized!.length,
              itemBuilder: (context, index) {
                final event = eventOrganized![index];
                return Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            event.startDate,
                            style: const TextStyle(
                                fontSize: 14, color: AppColors.primary),
                          ),
                          const SizedBox(
                            width: 20,
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
                );
              },
            )
          : Center(
              child: Text(
                'No $state events',
              ),
            ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';


import '../../../event/business_logic/cubit/event_cubit.dart';
import '../../../service_locator.dart';
import '../../../shared/routes/routes.gr.dart';
import '../../../event/presentation/widgets/event_item_widget.dart';
import '../../../category/presentation/widgets/category_item_widget.dart';

@RoutePage()
class EventListScreen extends StatefulWidget {
  EventListScreen({super.key});

  @override
  State<EventListScreen> createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EventCubit, EventState>(
        bloc: getIt.get<EventCubit>(),
        builder: (context, state) {
          if (state.isLoadingEvent) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
                child: Column(
                  children: [
                    for (int i = 0; i <= 3; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Shimmer.fromColors(
                          baseColor: const Color.fromARGB(255, 236, 234, 234),
                          highlightColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height,
                                  width: 122,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                ),
                                const Column(
                                  children: [
                                    Text(
                                      'chargement',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }

          if (state.errorLoadingEvent) {
            return Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    getIt.get<EventCubit>().getEvent();
                  },
                  child: const Center(
                    child: Text('Try again'),
                  ),
                ),
                Text(
                  '${state.message}',
                ),
              ],
            );
          }

          if (state.events?.isEmpty ?? true) {
            return Center(
              child: CategoryItemWidget.categoryName == ''
                  ? const Text(
                      'No events found for this search',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    )
                  : Text(
                      'No events found for ${CategoryItemWidget.categoryName} category',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
            );
          }

          var events = state.events!;

          return Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 15),
            child: ListView.builder(
              itemBuilder: (context, index) {
                var event = events[index];
               

                return GestureDetector(
                  onTap: () {
                    context.router.push(DetailEventRoute(event: event));
                  },
                  child: EventItemWidget(
                    path:
                        'http://192.168.28.229:8000/storage/${event.pathImage}',
                    category: event.categories.first.name,
                    title: event.title,
                    description: event.description,
                    location: event.location.name,
                    date: event.startDate,
                  ),
                );
              },
              itemCount: events.length,
            ),
          );
        },
      ),
    );
  }
}

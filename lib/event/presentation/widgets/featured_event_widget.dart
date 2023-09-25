import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/shared/routes/routes.gr.dart';

import '../../../shared/utils/app_colors.dart';
import '../../../shared/widgets/button_price.dart';
import '../../../shared/utils/parse_date.dart';
import '../../business_logic/cubit/event_cubit.dart';
import '../../data/models/event_model.dart';

class FeaturedEventWidget extends StatelessWidget {
  const FeaturedEventWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventCubit, EventState>(
      bloc: getIt.get<EventCubit>()..getEvent(),
      builder: (context, state) {
        if (state.isLoadingEvent) {
          return Container(
            height: 256,
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (int i = 0; i <= 4; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        height: 255,
                        width: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 10,
                                width: 20,
                                color: AppColors.white,
                              ),
                            ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                height: 10,
                                width: 40,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }
        if (state.errorLoadingEvent) {
          return const Column(
            children: [
              Center(
                child: Text("An error has occurred"),
              ),
            ],
          );
        }
        // var events = state.events;
        List<EventModel> featuredEvents = [];
        for (var event in state.events!) {
          if (event.featured == 1) {
            featuredEvents.add(event);
          }
        }
        print(featuredEvents);
        if (featuredEvents.isEmpty) {
          return const Text(
            'Aucune donnée',
          );
        }
        return SizedBox(
            height: 260,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: featuredEvents.length,
              itemBuilder: (context, index) {
                var event = featuredEvents[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      context.router.push(DetailEventRoute(event: event));
                    },
                    child: Card(
                      child: Container(
                        // height: 50,
                        width: 230,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.white,
                          // boxShadow: const [
                          //   BoxShadow(
                          //     color: Color.fromARGB(35, 128, 129, 128),
                          //     offset: Offset(
                          //       5.0,
                          //       5.0,
                          //     ),
                          //     blurRadius: 10.0,
                          //     spreadRadius: 2.0,
                          //   ), //BoxShadow
                          //   BoxShadow(
                          //     color: Color.fromARGB(255, 255, 255, 255),
                          //     offset: Offset(0.0, 0.0),
                          //     blurRadius: 0.0,
                          //     spreadRadius: 0.0,
                          //   ),
                          // ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 165,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: Image.network(
                                        'https://nvxubcejz.preview.infomaniak.website/storage/${event.pathImage}',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                // const Padding(
                                //   padding: EdgeInsets.all(8.0),
                                //   child: ButtonLikeWidget(),
                                // )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(children: <TextSpan>[
                                      TextSpan(
                                        text: Convertion()
                                            .dateTime(event.startDate),
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ]),
                                  ),
                                  Text(
                                    event.title,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14,
                                    ),
                                  ),
                                  Text(
                                    event.categories.first.name,
                                    style: const TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if (event.price == null)
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 6),
                                      child: ButtonPriceWidget(
                                        price: 'Free',
                                      ),
                                    )
                                  else
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 6),
                                      child: ButtonPriceWidget(
                                        price: event.price.toString(),
                                      ),
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ));
      },
    );
  }
}

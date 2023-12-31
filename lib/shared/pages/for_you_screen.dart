import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showbook/profil/business_logic/cubit/profil_cubit.dart';
import 'package:showbook/search/presentation/pages/search_screen.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/shared/routes/routes.gr.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/profil/presentation/widgets/artist_item_widget.dart';
import 'package:showbook/event/presentation/widgets/featured_event_widget.dart';

import '../../application_screen.dart';
import '../../category/presentation/widgets/category_item_widget.dart';
import '../../event/business_logic/cubit/event_cubit.dart';

@RoutePage()
class ForYouScreen extends StatefulWidget {
  const ForYouScreen({super.key});

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  @override
  void initState() {
    getIt.get<EventCubit>().getEvent();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          // featured events
          const SizedBox(
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Featured events',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                FeaturedEventWidget(),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          // categories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.router.push(const CategoryListRoute());
                },
                child: const Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 100,
            child: CategoryItemWidget(),
          ),
          // Artits
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Artits',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      SearchScreen.indexTab = 1;
                      ApplicationScreen.indexSearch = 1;
                      getIt.get<ProfilCubit>().getProfil(type: 'artist');
                      context.router.pushAndPopUntil(
                        const ApplicationRoute(),
                        predicate: (_) => false,
                      );
                    },
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 13,
              ),
              const ArtistItemWidget(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          // events near you
          // SizedBox(
          //   child: Column(
          //     children: [
          //       const SizedBox(
          //         height: 20,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           const Text(
          //             'Events near you',
          //             style: TextStyle(
          //               fontSize: 16,
          //               fontWeight: FontWeight.w900,
          //             ),
          //           ),
          //           GestureDetector(
          //             onTap: () {},
          //             child: const Text(
          //               'See all',
          //               style: TextStyle(
          //                 fontSize: 12,
          //                 color: AppColors.primary,
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //       //   for (int i = 0; i <= 5; i++)
          //       //     const Padding(
          //       //       padding: EdgeInsets.only(top: 20),
          //       //       child: EventItemWidget(
          //       //           // category: category,
          //       //           title: title,
          //       //           description: description,
          //       //           location: location,
          //       //           date: date),
          //       //     ),
          //     ],
          //   ),
          // )
        ],
      ),
    );
  }
}

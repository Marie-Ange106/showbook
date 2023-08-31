import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showbook/shared/pages/for_you_screen.dart';
import 'package:showbook/shared/pages/subscripions_screen.dart';
import 'package:showbook/shared/widgets/vertical_menu.dart';
import 'package:showbook/shared/routes/routes.gr.dart';
import 'package:showbook/shared/utils/app_colors.dart';

import '../../application_screen.dart';
import '../../service_locator.dart';
import '../../event/business_logic/cubit/event_cubit.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {
                ApplicationScreen.indexSearch = 1;
                getIt.get<EventCubit>().getEvent();
                context.router.pushAndPopUntil(
                  const ApplicationRoute(),
                  predicate: (_) => false,
                );
              },
            ),
          ),
        ],
        title: const Center(
          child: Image(
            height: 50,
            width: 130,
            image: AssetImage(
              'assets/images/logo-showbook.png',
            ),
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary,
          automaticIndicatorColorAdjustment: false,
          labelColor: AppColors.primary,
          labelPadding: const EdgeInsets.only(top: 10),
          tabs: const [
            Text(
              'For you',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              'Subscriptions',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      drawer: const VerticalMenuScreen(),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ForYouScreen(),
          SubscriptionScreen(),
        ],
      ),
    );
  }
}

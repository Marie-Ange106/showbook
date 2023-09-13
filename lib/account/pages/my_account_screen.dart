import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showbook/account/pages/followed_list_screen.dart';
import 'package:showbook/account/pages/notification_list_screen.dart';
import 'package:showbook/account/pages/ticket_list_screen.dart';
import 'package:showbook/shared/routes/routes.gr.dart';
import 'package:showbook/shared/widgets/vertical_menu.dart';

import '../../shared/utils/app_colors.dart';

@RoutePage()
class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                context.router.push(const SettingsRoute());
              },
              child: IconButton(
                icon: const Icon(
                  Icons.settings,
                ),
                onPressed: () {
                  context.router.push(const SettingsRoute());
                },
              ),
            ),
          ),
        ],
        title: const Center(
            child: Text(
          'My account',
          style: TextStyle(
            fontSize: 18,
          ),
        )),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.primary,
          automaticIndicatorColorAdjustment: false,
          labelColor: AppColors.primary,
          labelPadding: const EdgeInsets.only(top: 10),
          tabs: const [
            Text(
              'Profils followed',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              'Tickets',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              'Notifications',
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
          FollowedListScreen(),
          TicketListScreen(),
          NotificationListScreen(),
        ],
      ),
    );
  }
}

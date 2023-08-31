import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:showbook/event/business_logic/cubit/event_cubit.dart';
import 'package:showbook/profil/business_logic/cubit/profil_cubit.dart';
import 'package:showbook/shared/pages/home_screen.dart';
import 'package:showbook/account/pages/my_account_screen.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/user_event/presentation/pages/my_event.dart';
import 'package:showbook/search/presentation/pages/search_screen.dart';

@RoutePage()
class ApplicationScreen extends StatefulWidget {
  static int indexSearch = 0;
  static String statutSearch ='';
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const SearchScreen(),
      const MyEventScreen(),
      const MyAccountScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),

        // title: ("Home"),
        activeColorPrimary: CupertinoColors.systemRed,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search),
        // title: ("Home"),
        onPressed: (_) {
          _controller.index = 1;
          ApplicationScreen.statutSearch='search';
          getIt.get<EventCubit>().getEvent();
          getIt.get<ProfilCubit>().getProfil();
        },
        activeColorPrimary: CupertinoColors.systemRed,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_month),
        // title: ("Home"),
        activeColorPrimary: CupertinoColors.systemRed,
        inactiveColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        // title: ("Home"),
        activeColorPrimary: CupertinoColors.systemRed,
        inactiveColorPrimary: CupertinoColors.black,
      ),
    ];
  }

  @override
  void initState() {
    // gérer la redirection vers la seacrh page
    _controller = PersistentTabController();
    if (ApplicationScreen.indexSearch == 1) {
      _controller.index = ApplicationScreen.indexSearch;
    }
    // else if (_controller.index != 1) {
    //   getIt.get<EventCubit>().getEvent();
    // }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      items: _navBarsItems(),
      screens: _buildScreens(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}

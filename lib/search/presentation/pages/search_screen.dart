import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:showbook/home/business_logic/cubit/event_cubit.dart';
import 'package:showbook/home/business_logic/cubit/profil_cubit.dart';
import 'package:showbook/search/presentation/pages/event_list_screen.dart';
import 'package:showbook/search/presentation/pages/filter_screen.dart';
import 'package:showbook/search/presentation/pages/profil_list_screen.dart';
import 'package:showbook/service_locator.dart';
import '../../../shared/utils/app_colors.dart';

@RoutePage()
class SearchScreen extends StatefulWidget {
  static int indexTab = 0;
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  bool _isBottomSheetOpen = false;

  void _openBottomSheet(BuildContext context) {
    setState(() {
      _isBottomSheetOpen = true;
    });

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const FilterScreen();
      },
    ).whenComplete(() {
      setState(() {
        _isBottomSheetOpen = false;
      });
    });
  }

  @override
  void initState() {
    // gestion du deplacement vers la vue profil de la search page
    _tabController = TabController(length: 2, vsync: this);
    if (SearchScreen.indexTab == 1) {
      _tabController.index = SearchScreen.indexTab;
    }
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
                Icons.filter_list,
              ),
              onPressed: () {
                if (!_isBottomSheetOpen) {
                  _openBottomSheet(context);
                }
              },
            ),
          ),
        ],
        title: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[300],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                    ),
                    onChanged: (value) {
                      getIt.get<EventCubit>().getEvent(
                            keyword: value,
                          );
                      getIt.get<ProfilCubit>().getProfil(keyword: value);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                    onPressed: () {},
                  ),
                ),
                // IconButton(
                //   icon: const Icon(Icons.clear),
                //   onPressed: () {
                //     setState(() {
                //       _searchController.clear();
                //     });
                //   },
                // ),
              ],
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
              'Events',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
            Text(
              'Profils',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          EventListScreen(),
          const ProfilListScreen(),
        ],
      ),
    );
  }
}

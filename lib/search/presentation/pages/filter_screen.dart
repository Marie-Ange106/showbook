import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/home/business_logic/cubit/category_cubit.dart';
import 'package:showbook/search/presentation/pages/search_screen.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/widgets/button_widget.dart';

import '../../../application_screen.dart';
import '../../../home/business_logic/cubit/event_cubit.dart';
import '../../../shared/routes/routes.gr.dart';
import '../widgets/item_filter_widget.dart';

class FilterScreen extends StatefulWidget {
  // final CategoryCubit categoryCubit;
  const FilterScreen({
    super.key,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _currentRangeValues = const RangeValues(20, 80);
  String selectedCategory = 'All categories';
  DateTime? selectedDate;
  bool isExpanded = false;
  double height = 500;
  double heightContainerCategories = 100;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isExpanded ? 650 : 500,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Filters',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 187, 184, 184),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // categories*********************
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.category,
                    ),
                  ],
                ),
                SizedBox(
                  height: isExpanded ? 250 : 100,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              'Category',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        child: BlocBuilder<CategoryCubit, CategoryState>(
                          bloc: (getIt
                                      .get<CategoryCubit>()
                                      .state
                                      .categories
                                      ?.isEmpty ??
                                  true)
                              ? getIt.get<CategoryCubit>().getCategory()
                              : getIt.get<CategoryCubit>(),
                          builder: (context, state) {
                            var categories = state.categories;
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ExpansionTile(
                                  title: Text(selectedCategory),
                                  initiallyExpanded: isExpanded,
                                  onExpansionChanged: (value) {
                                    setState(() {
                                      isExpanded = value;
                                    });
                                  },
                                  children: [
                                    SizedBox(
                                      height: isExpanded ? 150 : 125,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: state.categories!.length,
                                        itemBuilder: (context, index) {
                                          var category = categories![index];
                                          return ListTile(
                                            title: Text(category.name),
                                            onTap: () {
                                              setState(() {
                                                selectedCategory =
                                                    category.name;
                                                // isExpanded = false;
                                              });
                                              // widget.onFilterSelected(
                                              //     selectedCategory, selectedDate);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Date **********************
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.calendar_today,
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Date',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2024),
                            );
                            if (pickedDate != null) {
                              setState(() {
                                selectedDate = pickedDate;
                              });
                              // widget.onFilterSelected(
                              //     selectedCategory, selectedDate);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              selectedDate == null
                                  ? 'Any date'
                                  : selectedDate.toString(),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),

                // const SizedBox(
                //   height: 30,
                // ),
                // ItemFilterWidget(
                //   icon: Icons.location_on,
                //   title: 'Location',
                //   value: 'Any location',
                // ),
                const SizedBox(
                  height: 30,
                ),
                // price *********************
                ItemFilterWidget(
                  icon: Icons.price_change,
                  title: 'Price',
                  value: '',
                ),
                Column(
                  children: [
                    RangeSlider(
                      values: _currentRangeValues,
                      min: 0,
                      max: 100,
                      labels: const RangeLabels('start', 'end'),
                      activeColor: AppColors.primary,
                      inactiveColor: const Color.fromARGB(255, 197, 197, 197),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValues = values;
                        });
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Min price: ${_currentRangeValues.start.round()}',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            'Max price: ${_currentRangeValues.end.round()}',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  ApplicationScreen.indexSearch = 1;
                  SearchScreen.indexTab = 0;
                  getIt.get<EventCubit>().getEvent(
                        category: selectedCategory,
                        // date: selectedDate.toString(),
                        // price: _currentRangeValues.start.round(),
                      );
                  context.router.pushAndPopUntil(
                    const ApplicationRoute(),
                    predicate: (_) => false,
                  );
                },
                child: const ButtonWidget(
                  text: 'Apply',
                  textColor: AppColors.white,
                  borderColor: AppColors.primary,
                  bgColor: AppColors.primary,
                  height: 40,
                  width: 300,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

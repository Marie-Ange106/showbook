import 'package:auto_route/auto_route.dart';
import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/search/presentation/pages/search_screen.dart';

import '../../../application_screen.dart';
import '../../../category/business_logic/cubit/category_cubit.dart';
import '../../../event/business_logic/cubit/event_cubit.dart';
import '../../../service_locator.dart';
import '../../../shared/routes/routes.gr.dart';
import '../../../shared/utils/app_colors.dart';
import '../../../shared/widgets/button_widget.dart';

class FilterScreen extends StatefulWidget {
  // final CategoryCubit categoryCubit;
  const FilterScreen({
    super.key,
  });

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String selectedCategoryFilter = "";
  int count = 0;
  int today = 0;
  int thisWeek = 0;
  int thisWeekEnd = 0;
  int thisMonth = 0;
  int thisYear = 0;
  int free = 0;
  int paid = 0;
  bool selectedDate = false;

  int tagDate = 0;
  int tagPrice = 0;
  List<String> optionDate = [
    'All Date',
    'Today',
    'This Week',
    'This Week-end',
    'This Month',
    'This Year',
  ];
  List<String> optionPrice = [
    'All price',
    'Paid',
    'Free',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
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
                // categories***********************
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Category',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: SingleChildScrollView(
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
                                DropdownButtonFormField(
                                  value: 'Concert',
                                  items: categories!.map((e) {
                                    return DropdownMenuItem(
                                      value: e.name,
                                      child: Text(e.name),
                                    );
                                  }).toList(),
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        selectedCategoryFilter = val!;
                                        count++;
                                      },
                                    );
                                  },
                                  dropdownColor:
                                      const Color.fromARGB(255, 246, 226, 226),
                                  menuMaxHeight: 200,
                                  borderRadius: BorderRadius.circular(20),
                                  decoration: InputDecoration(
                                    // contentPadding: EdgeInsets.symmetric(horizontal: 20),
                                    iconColor: AppColors.primary,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                          color: Colors.black12),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        width: 1,
                                        color: Color.fromARGB(255, 254, 2, 2),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // Date **********************
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
                    ChipsChoice<int>.single(
                      value: tagDate,
                      onChanged: (val) => setState(() {
                        tagDate = val;
                        count++;
                        if (tagDate == 1) {
                          today = 1;
                        }
                        if (tagDate == 2) {
                          thisWeek = 1;
                        }
                        if (tagDate == 3) {
                          thisWeekEnd = 1;
                        }
                        if (tagDate == 4) {
                          thisMonth = 1;
                        }
                        if (tagDate == 5) {
                          thisYear = 1;
                        }
                      }),
                      choiceItems: C2Choice.listFrom<int, String>(
                        source: optionDate,
                        value: (i, v) => i,
                        label: (i, v) => v,
                      ),
                      wrapped: true,
                      choiceCheckmark: true,
                      // choiceStyle: const C2ChipStyle(
                      //     checkmarkColor: AppColors.primary,
                      //     foregroundStyle: TextStyle(
                      //       color: AppColors.primary,
                      //     )),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 20,
                ),
                // price *********************
                const Text(
                  'Price',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                Column(
                  children: [
                    ChipsChoice<int>.single(
                      value: tagPrice,
                      onChanged: (val) => setState(() {
                        tagPrice = val;
                        count++;
                        if (tagPrice == 1) {
                          today = 1;
                        }
                        if (tagPrice == 2) {
                          thisWeek = 1;
                        }
                      }),
                      choiceItems: C2Choice.listFrom<int, String>(
                        source: optionPrice,
                        value: (i, v) => i,
                        label: (i, v) => v,
                      ),
                      wrapped: true,
                      choiceCheckmark: true,
                      // choiceStyle: const C2ChipStyle(
                      //     checkmarkColor: AppColors.primary,
                      //     foregroundStyle: TextStyle(
                      //       color: AppColors.primary,
                      //     )),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),

            // button filter*******************
            Center(
              child: InkWell(
                onTap: () {
                  ApplicationScreen.indexSearch = 1;
                  SearchScreen.indexTab = 0;
                  getIt.get<EventCubit>().getEvent(
                        category: selectedCategoryFilter,
                        today: today,
                        thisWeek: thisWeek,
                        thisMonth: thisMonth,
                        thisWeekEnd: thisWeekEnd,
                        thisYear: thisYear,
                        paid: paid,
                        free: 1,
                      );
                  context.router.pushAndPopUntil(
                    const ApplicationRoute(),
                    predicate: (_) => false,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: AppColors.grayScale,
                      content: Center(
                        child: Text(
                          '${count} filter apply',
                        ),
                      ),
                    ),
                  );
                  // print(thisYear);
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

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:showbook/category/business_logic/cubit/category_cubit.dart';
import 'package:showbook/service_locator.dart';
import 'package:showbook/shared/routes/routes.gr.dart';
import 'package:showbook/shared/utils/app_colors.dart';

import '../../../application_screen.dart';
import '../../../event/business_logic/cubit/event_cubit.dart';
import '../../../search/presentation/pages/search_screen.dart';

class CategoryItemWidget extends StatefulWidget {
  static String categoryName = '';
  const CategoryItemWidget({super.key});

  @override
  State<CategoryItemWidget> createState() => _CategoryItemWidgetState();
}

class _CategoryItemWidgetState extends State<CategoryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      bloc: getIt.get<CategoryCubit>(), 
      builder: (context, state) {
        if (state.isLoadingCategory) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i <= 5; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 35),
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          color: AppColors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            height: 10,
                            width: 50,
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          );
        }

        if (state.errorLoadingCategory) {
          return Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  getIt.get<CategoryCubit>().getCategory();
                },
                child: const Center(
                  child: Text('Try again'),
                ),
              ),
              Text('${state.message}')
            ],
          );
        }
        // print(state.categories);
        var categories = state.categories!;
        // print(categories);
        return ListView.builder(
          scrollDirection: Axis.horizontal, 
          itemBuilder: (context, index) {
            var category = categories[index];
            return Padding(
              padding: const EdgeInsets.only(right: 30),
              child: GestureDetector(
                onTap: () {
                  ApplicationScreen.indexSearch = 1;
                  SearchScreen.indexTab = 0;
                  
                  CategoryItemWidget.categoryName = category.name;
                  getIt
                      .get<EventCubit>()
                      .getEvent(category: CategoryItemWidget.categoryName);

                  context.router.pushAndPopUntil(
                    const ApplicationRoute(),
                    predicate: (_) => false,
                  );
                },
                child: Column(
                  children: [
                    SvgPicture.network(
                      'https://nvxubcejz.preview.infomaniak.website/storage/${category.imagePath}',
                      
                      height: 40,
                      width: 40,
                      color: AppColors.primary,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      category.name,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          itemCount: categories.length,
        );
      },
    );
  }
}

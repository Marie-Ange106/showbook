import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/event/business_logic/cubit/event_cubit.dart';
import 'package:showbook/shared/utils/app_colors.dart';

import '../../../search/presentation/pages/search_screen.dart';
import '../../../service_locator.dart';
import '../../../shared/routes/routes.gr.dart';
import '../../business_logic/cubit/category_cubit.dart';

@RoutePage()
class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 214, 214),
        // elevation: 2,
        title: const Text(
          'List of category',
        ),
      ),
      body: BlocBuilder<CategoryCubit, CategoryState>(
        bloc: getIt.get<CategoryCubit>()..getCategory(),
        builder: (context, state) {
          var categories = state.categories!;

          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              var category = categories[index];
              return Padding(
                padding: const EdgeInsets.only(top: 20, left: 20, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        SearchScreen.indexTab = 0;
                        getIt
                            .get<EventCubit>()
                            .getEvent(category: category.name);
                        context.router.pushAndPopUntil(
                          const ApplicationRoute(),
                          predicate: (_) => false,
                        );
                        // context.router.pushAndPopUntil(
                        //   const SearchRoute(),
                        //   predicate: (_) => false,
                        // );
                      },
                      child: Text(
                        category.name,
                        style: const TextStyle(
                          color: AppColors.secondary,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: categories.length,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/home/business_logic/cubit/category_cubit.dart';
import 'package:showbook/service_locator.dart';

class CategoriesListFilter extends StatefulWidget {
  final Function(String) onCategorySelected;
  // final CategoryCubit categoryCubit;
  const CategoriesListFilter({
    super.key,
    required this.onCategorySelected,
  });

  @override
  State<CategoriesListFilter> createState() => _CategoriesListFilterState();
}

class _CategoriesListFilterState extends State<CategoriesListFilter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category'),
        BlocBuilder<CategoryCubit, CategoryState>(
          bloc: getIt.get<CategoryCubit>()..getCategory(),
          builder: (context, state) {
            List<DropdownMenuItem<String>> dropdownItems = state.categories!
                .map((category) => DropdownMenuItem(
                      value: category.name,
                      child: Text(category.name),
                    ))
                .toList();
            return DropdownButton(
              value: state.selectedCategory,
              onChanged: ((value) {
                widget.onCategorySelected(value!);
                getIt.get<CategoryCubit>().selectedCategory(value);
              }),
              items: dropdownItems,
            );
          },
        ),
      ],
    );
  }
}

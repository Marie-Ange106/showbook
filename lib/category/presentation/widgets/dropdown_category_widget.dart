import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:showbook/shared/utils/app_colors.dart';

import '../../business_logic/cubit/category_cubit.dart';
import '../../../service_locator.dart';

class DropDownCategoryWidget extends StatefulWidget {
  const DropDownCategoryWidget({super.key});

  @override
  State<DropDownCategoryWidget> createState() => _DropDownCategoryWidgetState();
}

class _DropDownCategoryWidgetState extends State<DropDownCategoryWidget> {
  String _selectedOption = 'Concert';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: BlocBuilder<CategoryCubit, CategoryState>(
          bloc: (getIt.get<CategoryCubit>().state.categories?.isEmpty ?? true)
              ? getIt.get<CategoryCubit>().getCategory()
              : getIt.get<CategoryCubit>(),
          builder: (context, state) {
            List<String> categories = [];
            for (var category in state.categories!) {
              categories.add(category.name);
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField(
                  value: _selectedOption,
                  items: categories.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(
                      () {
                        _selectedOption = val!;
                      },
                    );
                  },
                  dropdownColor: const Color.fromARGB(255, 227, 227, 227),
                  menuMaxHeight: 200,
                  borderRadius: BorderRadius.circular(20),
                  decoration: InputDecoration(
                    iconColor: AppColors.primary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
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
    );
  }
}

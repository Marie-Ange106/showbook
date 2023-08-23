import 'package:bloc/bloc.dart';
import 'package:showbook/home/data/models/category_model.dart';
import 'package:showbook/home/data/repositories/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryCubit({required this.categoryRepository})
      : super(
          CategoryState(),
        );

  getCategory() async {
    try {
      emit(
        state.copyWith(
          isLoadingCategory: true,
          sucessLoadingCategory: false,
          errorLoadingCategory: false,
        ),
      );

      var categories = await categoryRepository.getCategory();
      // print(categories);
      emit(
        state.copyWith(
          categories: categories,
          isLoadingCategory: false,
          sucessLoadingCategory: true,
          errorLoadingCategory: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoadingCategory: false,
          sucessLoadingCategory: true,
          errorLoadingCategory: false,
          message: e.toString(),
        ),
      );
      // print(e);
    }
  }

  selectedCategory(String category) {
    emit(
      state.copyWith(
        selectedCategory: category,
      ),
    );
  }
}

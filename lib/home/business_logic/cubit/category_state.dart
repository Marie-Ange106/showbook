part of 'category_cubit.dart';

class CategoryState {
  List<CategoryModel>? categories;
  bool isLoadingCategory;
  bool sucessLoadingCategory;
  bool errorLoadingCategory;
  String? message;
  String? selectedCategory;

  CategoryState({
    this.categories,
    this.isLoadingCategory = false,
    this.sucessLoadingCategory = false,
    this.errorLoadingCategory = false,
    this.message,
    this.selectedCategory,
  });

  CategoryState copyWith({
    List<CategoryModel>? categories,
    bool? isLoadingCategory,
    bool? sucessLoadingCategory,
    bool? errorLoadingCategory,
    String? message,
    String? selectedCategory,
  }) {
    return CategoryState(
      categories: categories ?? this.categories,
      isLoadingCategory: isLoadingCategory ?? this.isLoadingCategory,
      sucessLoadingCategory:
          sucessLoadingCategory ?? this.sucessLoadingCategory,
      errorLoadingCategory: errorLoadingCategory ?? this.errorLoadingCategory,
      message: message ?? this.message,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}

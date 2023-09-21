import 'package:dio/dio.dart';
import 'package:showbook/category/data/models/category_model.dart';

class CategoryRepository {
  final Dio dio;

  CategoryRepository({required this.dio});

  Future<List<CategoryModel>> getCategory() async {
    Response response =
    
        await dio.get('/api/showbook/category');
        
    var data = response.data["categories"];
    // print(data);
    List<CategoryModel> categories = [];
    for (var category in data) {
      categories.add(CategoryModel.fromJson(category));
    }
    // print(categories);
    return categories;
  }
}

import 'package:ecommerce_online_c11/features/main_layout/categories/data/models/category_model.dart';

abstract class CategoryRepoDatasource {
  Future<CategoryModel> getCategories();
}
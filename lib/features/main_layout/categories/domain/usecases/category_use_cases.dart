import 'package:dartz/dartz.dart';
import 'package:ecommerce_online_c11/core/exceptions/failuers.dart';
import 'package:ecommerce_online_c11/features/main_layout/categories/data/models/category_model.dart';
import 'package:ecommerce_online_c11/features/main_layout/categories/domain/repositrory/repo.dart';

class GetCategoriesUseCase {
  CategoryRepo repo;
  GetCategoriesUseCase(this.repo);

  Future<Either<FailureExceptions, CategoryModel>> call() =>
      repo.getCategories();
}

import 'package:dartz/dartz.dart';
import 'package:ecommerce_online_c11/core/exceptions/failuers.dart';
import 'package:ecommerce_online_c11/features/main_layout/home/data/models/category_model.dart';
import 'package:ecommerce_online_c11/features/main_layout/home/domain/repositrory/repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUseCase {
  CategoryRepo repo;
  GetCategoriesUseCase(this.repo);

  Future<Either<FailureExceptions, CategoryModel>> call() =>
      repo.getCategories();
}

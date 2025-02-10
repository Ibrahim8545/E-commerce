import 'package:dartz/dartz.dart';
import 'package:ecommerce_online_c11/core/exceptions/failuers.dart';
import 'package:ecommerce_online_c11/features/main_layout/home/data/data_source/remote/category_repo_datasource.dart';
import 'package:ecommerce_online_c11/features/main_layout/home/data/models/category_model.dart';
import 'package:ecommerce_online_c11/features/main_layout/home/domain/repositrory/repo.dart';

class CategoryRepoImp implements CategoryRepo {
  @override
  CategoryRepoDatasource categoryRepo;
  CategoryRepoImp(this.categoryRepo);
  Future<Either<FailureExceptions, CategoryModel>> getCategories() async {
    try {
      var data = await categoryRepo.getCategories();
      return Right(data);
    } catch (e) {
      return left(FailuerRemoteException(e.toString()));
    }
  }
}

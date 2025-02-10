import 'package:dio/dio.dart';
import 'package:ecommerce_online_c11/core/api/api_manager.dart';
import 'package:ecommerce_online_c11/core/api/end_points.dart';
import 'package:ecommerce_online_c11/core/exceptions/failuers.dart';
import 'package:ecommerce_online_c11/features/main_layout/home/data/data_source/remote/category_repo_datasource.dart';
import 'package:ecommerce_online_c11/features/main_layout/home/data/models/category_model.dart';

class CategoryRepoDatasourceImp implements CategoryRepoDatasource {
  @override
  ApiManager apiManager;

  CategoryRepoDatasourceImp(this.apiManager);

  Future<CategoryModel> getCategories() async {
    try {
      var data = await ApiManager().getData(endPoint: EndPoints.categories);

      return CategoryModel.fromJson(data.data);
    } catch (e) {
      throw FailuerRemoteException(e.toString());
    }
  }
}

import 'package:ecommerce_online_c11/di.dart';
import 'package:injectable/injectable.dart';
import 'package:ecommerce_online_c11/core/api/api_manager.dart';
import 'package:ecommerce_online_c11/core/api/end_points.dart';
import 'package:ecommerce_online_c11/core/exceptions/failuers.dart';
import 'package:ecommerce_online_c11/features/main_layout/home/data/data_source/remote/category_repo_datasource.dart';
import 'package:ecommerce_online_c11/features/main_layout/home/data/models/category_model.dart';

@Injectable(as: CategoryRepoDatasource)
class CategoryRepoDatasourceImp implements CategoryRepoDatasource {
  @override
  Future<CategoryModel> getCategories() async {
    try {
      var data =
          await getIt<ApiManager>().getData(endPoint: EndPoints.categories);

      return CategoryModel.fromJson(data.data);
    } catch (e) {
      throw FailuerRemoteException(e.toString());
    }
  }
}

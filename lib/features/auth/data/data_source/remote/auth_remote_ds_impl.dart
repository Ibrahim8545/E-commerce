import 'package:ecommerce_online_c11/core/api/api_manager.dart';
import 'package:ecommerce_online_c11/core/api/end_points.dart';
import 'package:ecommerce_online_c11/core/api/status_codes.dart';
import 'package:ecommerce_online_c11/core/cache/shared_pref.dart';
import 'package:ecommerce_online_c11/core/exceptions/failuers.dart';
import 'package:ecommerce_online_c11/features/auth/data/data_source/remote/auth_remote_ds.dart';
import 'package:ecommerce_online_c11/features/auth/data/models/user_model.dart';
import 'package:ecommerce_online_c11/features/auth/domain/entity/sign_up_entity.dart';
import 'package:flutter_svg/svg.dart';

class AuthRemoteDsImpl implements AuthRemoteDs {
  ApiManager apiManager;
  AuthRemoteDsImpl(this.apiManager);
  @override
  Future<bool> signIn(String email, String password) async {
    try {
      final response = await apiManager.postData(
          endPoint: EndPoints.signin,
          body: {"email": email, "password": password});

      if (response.statusCode == StatusCodes.success) {
        print(response.data['token']);
        await CacheHelper.setData<String>('token', response.data['token']);
        return true;
      }
      return false;
    } catch (e) {
      throw FailuerRemoteException(e.toString());
    }
  }

  @override
  Future<UserModel> signUp(SignUpEntity signUpEntity) async {
    try {
      final response = await apiManager.postData(
          endPoint: EndPoints.signup, body: signUpEntity.toJson());
      UserModel userModel = UserModel.fromJson(response.data);
      return userModel;
    } catch (e) {
      throw FailuerRemoteException(e.toString());
    }
  }
}

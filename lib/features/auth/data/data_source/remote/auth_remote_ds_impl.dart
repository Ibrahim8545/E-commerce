import 'package:dio/dio.dart';
import 'package:ecommerce_online_c11/features/auth/data/data_source/remote/auth_remote_ds.dart';
import 'package:ecommerce_online_c11/features/auth/domain/entity/sign_up_entity.dart';

class AuthRemoteDsImpl implements AuthRemoteDs {

  @override
  Future<bool> signIn(String email, String password) async {
    final dio = Dio();
    final response = await dio.post(
        'https://ecommerce.routemisr.com/api/v1/auth/signin',
        data: {"email": email, "password": password});



    if(response.statusCode==200){
      return true;
    }
    return false;
  }

  @override
  Future<bool> signUp(SignUpEntity signUpEntity) {
    // call api

    throw UnimplementedError();
  }
}

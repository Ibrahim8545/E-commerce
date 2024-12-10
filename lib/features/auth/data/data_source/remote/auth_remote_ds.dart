import 'package:ecommerce_online_c11/features/auth/domain/entity/sign_up_entity.dart';

abstract class AuthRemoteDs{


  Future<bool> signIn(String email, String password);
  Future<bool> signUp(SignUpEntity signUpEntity);

}
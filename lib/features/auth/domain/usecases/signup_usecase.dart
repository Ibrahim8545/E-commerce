import 'package:ecommerce_online_c11/features/auth/domain/entity/sign_up_entity.dart';
import 'package:ecommerce_online_c11/features/auth/domain/repository/auth_repo.dart';

class SignUpUseCase {
  AuthRepo repo;

  SignUpUseCase(this.repo);

  Future<bool> call(SignUpEntity signUpEntity)
  => repo.signUp(signUpEntity);
}

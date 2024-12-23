import 'package:ecommerce_online_c11/core/exceptions/failuers.dart';
import 'package:ecommerce_online_c11/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  AuthRepo repo;

  LoginUseCase(this.repo);

  Future<Either<FailureExceptions, bool>> call(String email, String password) =>
      repo.signIn(email, password);
}

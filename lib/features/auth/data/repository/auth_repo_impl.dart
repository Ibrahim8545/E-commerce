import 'package:dartz/dartz.dart';
import 'package:ecommerce_online_c11/core/exceptions/failuers.dart';
import 'package:ecommerce_online_c11/features/auth/data/data_source/remote/auth_remote_ds.dart';
import 'package:ecommerce_online_c11/features/auth/data/models/user_model.dart';
import 'package:ecommerce_online_c11/features/auth/domain/entity/sign_up_entity.dart';
import 'package:ecommerce_online_c11/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRemoteDs authRemoteDs;

  AuthRepoImpl(this.authRemoteDs);
  @override
  Future<Either<FailureExceptions, bool>> signIn(
      String email, String password) async {
    try {
      bool loggdedIn = await authRemoteDs.signIn(email, password);
      return Right(loggdedIn);
    } catch (e) {
      return left(FailuerRemoteException(e.toString()));
    }
  }

  @override
  Future<Either<FailureExceptions, UserModel>> signUp(
      SignUpEntity signUpEntity) async {
    try {
      var user = await authRemoteDs.signUp(signUpEntity);
      return Right(user);
    } catch (e) {
      return left(FailuerRemoteException(e.toString()));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:ecommerce_online_c11/features/auth/domain/usecases/login_usecase.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthLoginState> {
  LoginUseCase loginUseCase;
  AuthBloc(this.loginUseCase) : super(AuthLoginInit()) {
    on<AuthEvent>((event, emit) {});

    on<LoginEvent>((event, emit) async {
      state.copyWith(requestState: RequestState.loading);
      var data = await loginUseCase.call(event.email, event.password);

      data.fold((l) {
        emit(state.copyWith(
          loggedIn: false,
          requestState: RequestState.error,
          errorMessage: l.message,
        ));
      }, (r) {
        emit(state.copyWith(
          loggedIn: r,
          requestState: RequestState.success,
        ));
      });
      // if (loggedIn) {
      //   emit(state.copyWith(
      //     loggedIn: true,
      //     requestState: RequestState.success,
      //   ));
      // } else {
      //   emit(state.copyWith(
      //     loggedIn: false,
      //     requestState: RequestState.error,
      //     errorMessage: "Something went wrong",
      //   ));
      // }
    });
  }
}

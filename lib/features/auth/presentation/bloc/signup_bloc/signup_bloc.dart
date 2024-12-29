import 'package:ecommerce_online_c11/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ecommerce_online_c11/features/auth/presentation/bloc/signup_bloc/signup_event.dart';
import 'package:ecommerce_online_c11/features/auth/presentation/bloc/signup_bloc/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupBloc extends Bloc<AuthSignupEvent, AuthSigupState> {
  SignUpUseCase signUpUseCase;
  SignupBloc(this.signUpUseCase) : super(AuthSignupInit()) {
    on<AuthSignupEvent>((event, emit) {});
    on<SignupEvent>((event, emit) async {
      state.copyWith(requestState: RequestState.loading);
      var data = await signUpUseCase.call(event.signUpEntity);

      data.fold((l) {
        emit(state.copyWith(
          signedUp: false,
          requestState: RequestState.error,
          errorMessage: l.message,
        ));
      }, (r) {
        emit(
            state.copyWith(signedUp: true, requestState: RequestState.success));
      });
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:ecommerce_online_c11/features/auth/presentation/bloc/login_bloc/auth_bloc.dart';
import 'package:ecommerce_online_c11/features/main_layout/home/data/models/category_model.dart';
import 'package:ecommerce_online_c11/features/main_layout/home/domain/usecases/category_use_cases.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'category_event.dart';
part 'category_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetCategoriesUseCase getCategories;
  HomeBloc(this.getCategories) : super(HomeStateInit()) {
    on<GetCategoriesEvent>((event, emit) async {
      var result = await getCategories();

      result.fold((l) {
        emit(state.copyWith(
          errorMessage: l.message,
          requestState: RequestState.error,
        ));
      }, (r) {
        emit(state.copyWith(
          requestState: RequestState.success,
          category: r,
        ));
      });
    });
  }
}

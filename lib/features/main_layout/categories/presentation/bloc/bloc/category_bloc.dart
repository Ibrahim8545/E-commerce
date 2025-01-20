import 'package:bloc/bloc.dart';
import 'package:ecommerce_online_c11/features/auth/presentation/bloc/login_bloc/auth_bloc.dart';
import 'package:ecommerce_online_c11/features/main_layout/categories/data/models/category_model.dart';
import 'package:ecommerce_online_c11/features/main_layout/categories/domain/usecases/category_use_cases.dart';
import 'package:equatable/equatable.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetCategoriesUseCase getCategories;
  CategoryBloc(this.getCategories) : super(CategoryStateInit()) {
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

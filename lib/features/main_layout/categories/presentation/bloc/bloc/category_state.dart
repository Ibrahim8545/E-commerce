part of 'category_bloc.dart';

 class CategoryState {
  
  RequestState? requestState;
  CategoryModel? category;
  String? errorMessage;
  CategoryState({this.requestState, this.category, this.errorMessage});

  CategoryState copyWith(
      {RequestState? requestState, CategoryModel? category, String? errorMessage}) {
    return CategoryState(
        requestState: requestState ?? this.requestState,
        category: category ?? this.category,
        errorMessage: errorMessage ?? this.errorMessage);
  }


}
class CategoryStateInit extends CategoryState {
  CategoryStateInit()
      : super(
            requestState: RequestState.init, category: null, errorMessage: "");
}

enum RequestState { init, loading, success, error }

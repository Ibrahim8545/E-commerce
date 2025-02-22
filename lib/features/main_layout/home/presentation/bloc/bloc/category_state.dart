part of 'category_bloc.dart';

class HomeState {
  RequestState? requestState;
  CategoryModel? category;
  String? errorMessage;
  HomeState({this.requestState, this.category, this.errorMessage});

  HomeState copyWith(
      {RequestState? requestState,
      CategoryModel? category,
      String? errorMessage}) {
    return HomeState(
        requestState: requestState ?? this.requestState,
        category: category ?? this.category,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

class HomeStateInit extends HomeState {
  HomeStateInit()
      : super(
            requestState: RequestState.init, category: null, errorMessage: "");
}

enum RequestState { init, loading, success, error }

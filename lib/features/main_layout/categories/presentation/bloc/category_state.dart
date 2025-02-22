part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial(
  {
  @Default(RequestState.init) RequestState GetCategoriesState,
  CategoryModel? category,
  String? errorMessage

}) = _Initial;
}

part of 'categories_cubit.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  final List<String> categories;
  CategoriesLoaded(this.categories);
}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesError extends CategoriesState {
  final String message;
  CategoriesError(this.message);
}

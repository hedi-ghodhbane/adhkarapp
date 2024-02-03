import 'package:adhkarapp/features/categories/repositories/categories_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final CategoriesRepo repo;
  CategoriesCubit(this.repo) : super(CategoriesInitial());

  void loadCategories() async {
    emit(CategoriesLoading());
    final response = await repo.loadCategories();
    response.fold((message) => emit(CategoriesError(message)),
        (categories) => emit(CategoriesLoaded(categories)));
  }
}

import 'package:adhkarapp/core/data/json_loader.dart';
import 'package:dartz/dartz.dart';

class CategoriesRepo {
  final JsonLoader jsonLoader;
  const CategoriesRepo(this.jsonLoader);
  Future<Either<String, List<String>>> loadCategories() async {
    try {
      final response = await jsonLoader.loadJson();
      return Right(response.keys.toList());
    } catch (e) {
      return const Left('Unexpected error');
    }
  }
}

import 'package:shari_app/models/category_model.dart';

abstract class BaseCategoryRepository {
  Stream<List<Category>> getAllCatergories();
}

import 'package:shari_app/models/models.dart';

abstract class BaseProductRepository {
  Stream<List<Product>> getAllProducts();
}

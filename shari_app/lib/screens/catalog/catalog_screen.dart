// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shari_app/models/category_model.dart';
import 'package:shari_app/models/models.dart';
import 'package:shari_app/widgets/widgets.dart';
import 'package:shari_app/widgets/custom_appbar.dart';
import 'package:shari_app/widgets/custom_navbar.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({
    required Category category,
  }) {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => CatalogScreen(category: category),
    );
  }

  final Category category;
  const CatalogScreen({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.product
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
      appBar: CustomAppBar(title: category.name),
      bottomNavigationBar: CustomNavBar(),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: categoryProducts.length,
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ProductCard(
              product: categoryProducts[index],
              widthFactor: 2.2,
            ),
          );
        },
      ),
    );
  }
}

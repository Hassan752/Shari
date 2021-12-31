// ignore_for_file: prefer_const_constructors
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shari_app/blocs/cart/cart_bloc.dart';
import 'package:shari_app/blocs/category/category_bloc.dart';
import 'package:shari_app/blocs/checkout/checkout_bloc.dart';
import 'package:shari_app/blocs/product/product_bloc.dart';
import 'package:shari_app/blocs/wishlist/wishlist_bloc.dart';
import 'package:shari_app/config/app_router.dart';
import 'package:flutter/material.dart';
import 'package:shari_app/config/theme.dart';
import 'package:shari_app/repositories/category/category_repository.dart';
import 'package:shari_app/repositories/checkout/checkout_repository.dart';

import 'repositories/product/product_repository.dart';
import 'screens/home/home_screen.dart';
import 'package:shari_app/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        /*Provider<AuthService>(
          create: (_) => AuthService(),
        ),*/
        BlocProvider(create: (_) => WishlistBloc()..add(StartWishlist())),
        /*BlocProvider(
          create: (context) => CheckoutBloc(
              cartBloc: context.read<CartBloc>(),
              checkoutRepository: CheckoutRepository()),
        ),*/
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(
              LoadProducts(),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Shari',
        theme: theme(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
      ),
    );
  }
}

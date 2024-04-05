import 'package:flutter/material.dart';
import 'package:productsample/bloc/bloc/Authentication/bloc/authentication_bloc.dart';
import 'package:productsample/bloc/bloc/form_validation/bloc/form_bloc.dart';
import 'package:productsample/bloc/bloc/products_bloc.dart';
import 'package:productsample/bloc_navigate.dart';
import 'package:productsample/repository/auth_repository.dart';
import 'package:productsample/repository/db_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productsample/services/firestore_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
         BlocProvider(
              create: (context) =>   AuthenticationBloc(AuthenticationRepositoryImpl())
              ..add(AuthenticationStarted()),
            ),
            BlocProvider(
              create: (context) => FormBloc(
                  AuthenticationRepositoryImpl(), DatabaseRepositoryImpl()),
            ),
          
            BlocProvider<ProductsBloc>(
              create: (context) => ProductsBloc(FirestoreService()),
            ),
          ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a purple toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const BlocNavigate(),
      ),
    );
  }
}

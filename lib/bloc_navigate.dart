import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productsample/bloc/bloc/Authentication/bloc/authentication_bloc.dart';
import 'package:productsample/screens/home_screen.dart';
import 'package:productsample/screens/signup_view.dart';
import 'package:productsample/screens/welcome_screen.dart';

class BlocNavigate extends StatelessWidget {
  const BlocNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        debugPrint('state is--->$state');
       
        if (state is AuthenticationSuccess) {
          return const HomeScreen();
        } else if (state is AuthenticationFailure) {
          return const WelcomeView();
        } else {
          return const WelcomeView();
        }
      },
    );
  }
}
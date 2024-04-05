
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:productsample/bloc/bloc/Authentication/bloc/authentication_bloc.dart';
import 'package:productsample/bloc/bloc/form_validation/bloc/form_bloc.dart';
import 'package:productsample/screens/home_screen.dart';
import 'package:productsample/screens/signup_view.dart';
import 'package:productsample/utils/constant.dart';
import 'package:productsample/widget/email_field.dart';
import 'package:productsample/widget/password_field.dart';
import 'package:productsample/widget/signin_navigate.dart';
import 'package:productsample/widget/submit_button.dart';

OutlineInputBorder border = const OutlineInputBorder(
    borderSide: BorderSide(color: Constants.kBorderColor, width: 3.0));

class SignInView extends StatelessWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MultiBlocListener(
      listeners: [
        BlocListener<FormBloc, FormsValidate>(
          listener: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              showDialog(
                  context: context,
                  builder: (context) =>
                      ErrorDialog(errorMessage: state.errorMessage));
            } else if (state.isFormValid && !state.isLoading) {
              context.read<AuthenticationBloc>().add(AuthenticationStarted());
            } else if (state.isFormValidateFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text(Constants.textFixIssues)));
            }
          },
        ),
        BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state is AuthenticationSuccess) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                      (Route<dynamic> route) => false);
            }
          },
        ),
      ],
      child: Scaffold(
          appBar: AppBar(
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pop(),
  ), 
 
),
          backgroundColor: Constants.kPrimaryColor,
          body: Center(
              child: SingleChildScrollView(
                child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                 
                  SizedBox(height: size.height * 0.01),
                  const Text(
                    Constants.textSmallSignIn,
                    style: TextStyle(color: Constants.kDarkGreyColor),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: size.height * 0.02)),
                  const EmailField(),
                  SizedBox(height: size.height * 0.01),
                  const PasswordField(),
                  SizedBox(height: size.height * 0.01),
                  const SubmitButton(),
                  const SignInNavigate(),
                  SizedBox(height: size.height * 0.02,)
                ]),

              ))),
    );
  }
}









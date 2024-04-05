import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:productsample/screens/signin_view.dart';
import 'package:productsample/screens/signup_view.dart';
import 'package:productsample/utils/constant.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Constants.kPrimaryColor,
        body:AnnotatedRegion<SystemUiOverlayStyle>(
          value: Constants.statusBarColor,
          child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                SizedBox(height: size.height * 0.01),
                const Text(
                  Constants.textSmallSignUp,
                  style: TextStyle(color: Constants.kDarkGreyColor),
                ),
                SizedBox(height: size.height * 0.1),
                SizedBox(
                  width: size.width * 0.8,
                  child: OutlinedButton(
                    onPressed: () {
                      debugPrint('hello');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignInView()),
                      );
                    },
                    child: const Text(Constants.textSignIn),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Constants.kPrimaryColor),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Constants.kBlackColor),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide.none)),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpView()),
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Constants.kGreyColor),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide.none)),
                    child: const Text(
                      Constants.textSignUpBtn,
                      style: TextStyle(color: Constants.kBlackColor),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
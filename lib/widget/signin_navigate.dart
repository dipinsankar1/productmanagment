import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:productsample/screens/signup_view.dart';
import 'package:productsample/utils/constant.dart';

class SignInNavigate extends StatelessWidget {
  const SignInNavigate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: <TextSpan>[
          const TextSpan(
              text: Constants.textAcc,
              style: TextStyle(
                color: Constants.kDarkGreyColor,
              )),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignUpView()),
                  );
                },
              text: Constants.textSignUp,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Constants.kDarkBlueColor,
              )),
        ]));
  }
}
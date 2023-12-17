import 'package:demo_flutter/presentation/utils/spaces.dart';
import 'package:demo_flutter/presentation/widgets/gradient_button.dart';
import 'package:demo_flutter/presentation/widgets/input_field.dart';
import 'package:demo_flutter/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const Text("Sign in",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
              const SizedBox(
                height: 50,
              ),
              SocialButton(
                iconPath: 'assets/svgs/g_logo.svg',
                label: 'Continue with Google',
              ),
              const SizedBox(
                height: 15,
              ),
              SocialButton(
                  iconPath: 'assets/svgs/f_logo.svg',
                  label: 'Continue with Facebook'),
              verticalSpacing(15),
              const Text(
                "Or",
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
              verticalSpacing(15),
              const InputField(hintText: "Email"),
              verticalSpacing(15),
              const InputField(hintText: "Password"),
              const SizedBox(height: 15),
              const GradientButton(text: 'Sign In')
            ],
          )),
    ));
  }
}

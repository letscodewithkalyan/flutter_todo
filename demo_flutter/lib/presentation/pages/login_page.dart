import 'package:demo_flutter/presentation/feature/auth/bloc/authentication_bloc.dart';
import 'package:demo_flutter/presentation/utils/spaces.dart';
import 'package:demo_flutter/presentation/widgets/gradient_button.dart';
import 'package:demo_flutter/presentation/widgets/input_field.dart';
import 'package:demo_flutter/presentation/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
      if (state is Authenticated) {
        Navigator.pushNamed(context, '/home');
      } else if (state is UnAuthenticated) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Log in error'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ));
      }
    }, builder: (context, state) {
      if (state is LoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset('assets/images/signin_balls.png'),
                const Text("Sign in",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 50)),
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
                InputField(hintText: "Email", controller: emailController),
                verticalSpacing(15),
                InputField(
                  hintText: "Password",
                  controller: passwordController,
                ),
                const SizedBox(height: 15),
                GradientButton(
                    text: 'Sign In',
                    onPressed: () => {
                          context.read<AuthenticationBloc>().add(LoggedIn(
                              email: emailController.text,
                              password: passwordController.text))
                        })
              ],
            )),
      );
    }));
  }
}

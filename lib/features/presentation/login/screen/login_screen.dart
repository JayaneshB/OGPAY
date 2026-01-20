import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ogpay/app_router/app_router_constants.dart';
import 'package:ogpay/common/widgets/primary_cta_button.dart';
import 'package:ogpay/utility/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});
  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          decoration: BoxDecoration(gradient: AppColors.primaryGradient),
          child: Column(
            children: [
              /// TOP WHITE SPACE
              SizedBox(height: MediaQuery.of(context).padding.top + 100),

              /// LOGIN CARD FILLS REST OF SCREEN
              Expanded(
                child: LoginCard(
                  emailController: emailController,
                  passwordController: passwordController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Column(
        children: [
          /// 🔼 FORM SECTION (TOP)
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  const WelcomeBackHeader(),
                  const SizedBox(height: 32),
                  const FieldLabel(text: "Email"),
                  const SizedBox(height: 8),
                  EmailField(controller: emailController),
                  const SizedBox(height: 16),
                  const FieldLabel(text: "Password"),
                  const SizedBox(height: 8),
                  PasswordField(controller: passwordController),
                  const SizedBox(height: 15),
                  const ForgetPasswordText(),
                  const SizedBox(height: 25),
                  PrimaryButton(
                    title: "Login",
                    onPressed: () {
                      // Handle login action
                    },
                  ),
                  const SizedBox(height: 20),
                  SignUpContent(
                    onSignUpPressed: () {
                      context.push(AppRouteConstants.signUp);
                    },
                  ),
                ],
              ),
            ),
          ),

          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              
            ],
          ),
        ],
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.emeraldGreen,
      decoration:
          inputDecoration(
            hintText: "Enter your email",
            icon: Icons.email_outlined,
          ).copyWith(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
          ),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      cursorColor: AppColors.emeraldGreen,
      decoration:
          inputDecoration(
            hintText: "Enter your password",
            icon: Icons.lock_outline,
          ).copyWith(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
          ),
    );
  }
}

InputDecoration inputDecoration({
  required String hintText,
  required IconData icon,
}) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon: Icon(icon, size: 15),
    filled: true,
    fillColor: Colors.white,
    labelStyle: TextStyle(color: Colors.black),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: AppColors.emeraldGreen),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(25),
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
  );
}

class FieldLabel extends StatelessWidget {
  const FieldLabel({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: Colors.black, fontSize: 16),
    );
  }
}

class WelcomeBackHeader extends StatelessWidget {
  const WelcomeBackHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Welcome Back",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "We're so happy to see you again",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.black, fontStyle: FontStyle.normal),
        ),
      ),
    );
  }
}

class SignUpContent extends StatelessWidget {
  final VoidCallback onSignUpPressed;
  const SignUpContent({super.key, required this.onSignUpPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            onSignUpPressed();
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ogpay/app_router/app_router_constants.dart';
import 'package:ogpay/common/extension/og_extension.dart';
import 'package:ogpay/common/widgets/back_button_widget.dart';
import 'package:ogpay/common/widgets/email_inputfield_widget.dart';
import 'package:ogpay/common/widgets/password_inputfield_widget.dart';
import 'package:ogpay/common/widgets/primary_cta_button.dart';
import 'package:ogpay/utility/colors.dart';
import 'package:ogpay/utility/strings.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.title});
  final String title;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
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
              SizedBox(
                width: double.infinity,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 16),
                      child: BackButtonWidget(onPressed: () => context.pop()),
                    ),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.only(top: 50, right: 30),
                      child: Text(
                        AppStrings.signIn,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: LoginCard(
                  formKey: _formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  emailFocusNode: emailFocusNode,
                  passwordFocusNode: passwordFocusNode,
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
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.emailFocusNode,
    required this.passwordFocusNode,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const WelcomeBackHeader(),
              const FieldLabel(text: AppStrings.email),
              EmailField(
                controller: emailController,
                focusNode: emailFocusNode,
                nextFocusNode: passwordFocusNode,
              ),
              const FieldLabel(text: AppStrings.password),
              PasswordField(
                controller: passwordController,
                focusNode: passwordFocusNode,
              ),
              ForgetPasswordText(
                onForgotPasswordRedirection: () {
                  context.push(AppRouteConstants.forgotPassword);
                },
              ),
              PrimaryButton(
                title: AppStrings.login,
                onPressed: () {
                  emailFocusNode.unfocus();
                  passwordFocusNode.unfocus();

                  if (formKey.currentState!.validate()) {
                    // ✅ Valid
                  }
                },
              ),

              SignUpContent(
                onSignUpPressed: () {
                  context.push(AppRouteConstants.signUp);
                },
              ),
            ].spaced(16),
          ),
        ),
      ),
    );
  }
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
            AppStrings.welcomeOnboarding,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            AppStrings.welcomeBack,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class ForgetPasswordText extends StatelessWidget {
  final VoidCallback onForgotPasswordRedirection;
  const ForgetPasswordText({
    super.key,
    required this.onForgotPasswordRedirection,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          onForgotPasswordRedirection();
        },
        child: const Text(
          AppStrings.forgotPassword,
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
          AppStrings.dontHaveAccount,
          style: TextStyle(color: Colors.black),
        ),
        TextButton(
          onPressed: () {
            onSignUpPressed();
          },
          child: const Text(
            AppStrings.signup,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

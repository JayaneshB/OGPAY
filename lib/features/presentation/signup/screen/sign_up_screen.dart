import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ogpay/common/extension/og_extension.dart';
import 'package:ogpay/common/widgets/back_button_widget.dart';
import 'package:ogpay/common/widgets/dob_inputfield_widget.dart';
import 'package:ogpay/common/widgets/email_inputfield_widget.dart';
import 'package:ogpay/common/widgets/name_inputfield.dart';
import 'package:ogpay/common/widgets/password_inputfield_widget.dart';
import 'package:ogpay/common/widgets/primary_cta_button.dart';
import 'package:ogpay/utility/colors.dart';
import 'package:ogpay/utility/strings.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final dobFocusNode = FocusNode();
  final namefocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dobController.dispose();
    dobFocusNode.dispose();
    nameController.dispose();
    namefocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
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
                        AppStrings.signup,
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
                  nameController: nameController,
                  emailController: emailController,
                  passwordController: passwordController,
                  confirmPasswordController: confirmPasswordController,
                  dobController: dobController,
                  dobFocusNode: dobFocusNode,
                  namefocusNode: namefocusNode,
                  emailFocusNode: emailFocusNode,
                  passwordFocusNode: passwordFocusNode,
                  confirmPasswordFocusNode: confirmPasswordFocusNode,
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
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.dobController,
    required this.dobFocusNode,
    required this.namefocusNode,
    required this.emailFocusNode,
    required this.passwordFocusNode,
    required this.confirmPasswordFocusNode,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController dobController;
  final FocusNode dobFocusNode;
  final FocusNode namefocusNode;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;

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
              const WelcomeHeader(),
              const FieldLabel(text: AppStrings.name),
              NameField(
                controller: nameController,
                focusNode: namefocusNode,
                nextFocusNode: emailFocusNode,
              ),
              const FieldLabel(text: AppStrings.email),
              EmailField(
                controller: emailController,
                focusNode: emailFocusNode,
                nextFocusNode: dobFocusNode,
              ),
              const FieldLabel(text: AppStrings.dob),
              DatePickerField(
                controller: dobController,
                focusNode: dobFocusNode,
                nextFocusNode: passwordFocusNode,
              ),
              const FieldLabel(text: AppStrings.password),
              PasswordField(
                controller: passwordController,
                focusNode: passwordFocusNode,
              ),
              const FieldLabel(text: AppStrings.confirmPassword),
              PasswordField(
                controller: confirmPasswordController,
                focusNode: confirmPasswordFocusNode,
              ),
              SizedBox(height: 20),
              PrimaryButton(
                title: AppStrings.continueText,
                onPressed: () {
                  emailFocusNode.unfocus();
                  passwordFocusNode.unfocus();

                  if (formKey.currentState!.validate()) {
                    // ✅ Valid
                  }
                },
              ),
            ].spaced(12),
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

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.welcomeToOGPay,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 8),
          Text(
            AppStrings.createAccount,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ],
      ),
    );
  }
}

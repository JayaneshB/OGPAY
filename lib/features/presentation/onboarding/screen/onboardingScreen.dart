import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ogpay/app_router/app_router_constants.dart';
import 'package:ogpay/common/widgets/primary_cta_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome to the Onboarding Screen'),
            SizedBox(height: 20),
            PrimaryButton(
              title: "Login",
              onPressed: () {
                context.push(AppRouteConstants.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}

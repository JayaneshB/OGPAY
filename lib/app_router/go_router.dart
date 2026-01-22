import 'package:go_router/go_router.dart';
import 'package:ogpay/app_router/app_router_constants.dart';
import 'package:ogpay/features/presentation/onboarding/screen/onboardingScreen.dart';
import 'package:ogpay/features/presentation/login/screen/login_screen.dart';
import 'package:ogpay/features/presentation/signup/screen/sign_up_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRouteConstants.onboardingScreen,
  routes: [
    GoRoute(
      path: AppRouteConstants.onboardingScreen,
      builder: (context, state) => OnboardingScreen(),
    ),
    GoRoute(
      path: AppRouteConstants.login,
      builder: (context, state) {
        return LoginScreen();
      },
    ),
    GoRoute(
      path: AppRouteConstants.signUp,
      builder: (context, state) => Signupscreen(),
    ),
  ],
);

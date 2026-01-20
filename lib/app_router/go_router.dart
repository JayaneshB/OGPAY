import 'package:go_router/go_router.dart';
import 'package:ogpay/app_router/app_router_constants.dart';
import 'package:ogpay/features/presentation/onboarding/screen/onboardingScreen.dart';
import 'package:ogpay/features/presentation/login/screen/login_screen.dart';

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
        return LoginScreen(title: 'Login');
      },
    ),
  ],
);

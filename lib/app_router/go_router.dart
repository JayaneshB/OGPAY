import 'package:go_router/go_router.dart';
import 'package:ogpay/app_router/app_router_constants.dart';
import 'package:ogpay/screen/onboardingScreen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRouteConstants.onboardingScreen,
  routes: [
    GoRoute(
      path: AppRouteConstants.onboardingScreen,
      builder: (context, state) => OnboardingScreen(),
    ),
  ],
);

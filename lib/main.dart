import 'package:flutter/material.dart';
import 'package:ogpay/app_router/go_router.dart';

void main() {
  runApp(const OGPayApp());
}

class OGPayApp extends StatelessWidget {
  const OGPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'OGPay',
      theme: ThemeData(primarySwatch: Colors.green),
    );
  }
}

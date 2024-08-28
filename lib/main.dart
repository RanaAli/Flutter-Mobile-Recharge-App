import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/data/remote/mock_api_service.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MockApiService.instance.mockApiService;
    return MaterialApp(
      title: 'Flutter Mobile Recharge App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_mobile_recharge/mobile_recharge_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Mobile Recharge App'),
      ),
      body: body(context),
    );
  }

  Column body(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: Column(
            children: [
              const Text("Welcome to the App"),
              const Text("This is Text 2"),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MobileRechargePage()));
                },
                child: const Text("Next"),
              )
            ],
          ),
        ),
      ],
    );
  }
}

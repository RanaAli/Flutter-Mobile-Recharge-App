import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/widgets/mobile_recharge_screen/mobile_recharge_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
              Text("Welcome to the App"),
              Text("This is Text 2"),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          MobileRechargePage(title: "Select Beneficiary")));
                },
                child: Text("Next"),
              )
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/data/db/app_db.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_user.dart';
import 'package:mobile_recharge_app/navigation/routes.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_mobile_recharge/mobile_recharge_page.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  AppDb db = AppDb.instance;

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

  Row body(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Welcome to the App", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 32),
            FilledButton(
              onPressed: () {
                User user = db.user;
                user.maxPerBeneficiaryAmount = 1000;
                db.updateUser(user);
                navigateToBenSelectScreen(context);
              },
              child: const Text("Verified User"),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                User user = db.user;
                user.maxPerBeneficiaryAmount = 500;
                db.updateUser(AppDb.instance.user);
                navigateToBenSelectScreen(context);
              },
              child: const Text("Unverified User"),
            )
          ],
        ),
      ],
    );
  }
}

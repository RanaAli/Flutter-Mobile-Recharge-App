import 'package:flutter/material.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<StatefulWidget> createState() => _ConfirmationPage();
}

class _ConfirmationPage extends State<ConfirmationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Confirmation"),
      ),
      body: body(context),
    );
  }

  Column body(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(
          children: [
            Text("Name:"),
            SizedBox(width: 8),
            Text("Rana Ahsan Ali"),
          ],
        ),
        const Row(
          children: [
            Text("Number:"),
            SizedBox(width: 8),
            Text("+971554623827"),
          ],
        ),
        const Row(
          children: [
            Text("Topup Amount:"),
            SizedBox(width: 8),
            Text("AED 10"),
          ],
        ),
        const Row(
          children: [
            Text("Charges:"),
            SizedBox(width: 8),
            Text("AED 1"),
          ],
        ),
        const Row(
          children: [
            Text("Balance Amount:"),
            SizedBox(width: 8),
            Text("AED 89"),
          ],
        ),
        FilledButton(onPressed: () {}, child: const Text("Yallah")),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_confirmation/model_confirmation_page.dart';

class ConfirmationPage extends StatefulWidget {
  final ModelConfirmationPage data;

  const ConfirmationPage({super.key, required this.data});

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
        Row(
          children: [
            Text("Name:"),
            SizedBox(width: 8),
            Text(widget.data.beneficiary.name),
          ],
        ),
        Row(
          children: [
            Text("Number:"),
            SizedBox(width: 8),
            Text(widget.data.beneficiary.phone),
          ],
        ),
        Row(
          children: [
            Text("Topup Amount:"),
            SizedBox(width: 8),
            Text("${widget.data.amountEnum.value}"),
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

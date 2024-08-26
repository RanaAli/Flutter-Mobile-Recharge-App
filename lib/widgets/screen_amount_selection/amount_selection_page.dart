import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/widgets/screen_amount_selection/widgets/recharge_amounts_widget.dart';
import 'package:mobile_recharge_app/widgets/screen_confirmation/confirmation_page.dart';

class AmountSelectionPage extends StatefulWidget {
  const AmountSelectionPage({super.key});

  @override
  State<StatefulWidget> createState() => _AmountSelectionPage();
}

class _AmountSelectionPage extends State<AmountSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Select Amount"),
      ),
      body: body(context),
    );
  }

  Column body(BuildContext context) {
    return Column(
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
        const SizedBox(height: 8),
        const RechargeAmountWidget(),
        const SizedBox(height: 8),
        const Column(
          children: [
            Text("Available Amount:"),
            Text("AED 100"),
          ],
        ),
        FilledButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const ConfirmationPage()));
          },
          child: const Text("Next"),
        ),
      ],
    );
  }
}

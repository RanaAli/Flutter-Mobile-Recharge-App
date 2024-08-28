import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_amount_selection/widgets/recharge_amounts_widget.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_confirmation/confirmation_page.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/text_styles.dart';

class AmountSelectionPage extends StatefulWidget {
  final ModelBeneficiary data;

  const AmountSelectionPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _AmountSelectionState();
}

class _AmountSelectionState extends State<AmountSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Select Amount"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Name:"),
                const SizedBox(width: 8),
                Text(widget.data.name, style: textStyleNormalBoldBlue),
              ],
            ),
            Row(
              children: [
                const Text("Number:"),
                const SizedBox(width: 8),
                Text(widget.data.phone, style: textStyleNormalBoldBlack),
              ],
            ),
            const SizedBox(height: 8),
            const RechargeAmountWidget(),
            const SizedBox(height: 8),
            const Column(
              children: [
                Text("Available Amount:"),
                Text("AED 100", style: textStyleNormalBoldBlack),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ConfirmationPage()));
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

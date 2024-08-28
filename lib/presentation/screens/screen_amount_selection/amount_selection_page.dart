import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/navigation/routes.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_amount_selection/widgets/amounts_enum.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_amount_selection/widgets/recharge_amounts_widget.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_confirmation/model_confirmation_page.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/text_styles.dart';

class AmountSelectionPage extends StatefulWidget {
  final ModelBeneficiary data;

  const AmountSelectionPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _AmountSelectionState();
}

class _AmountSelectionState extends State<AmountSelectionPage> {
  AmountsEnum amountsEnum = AmountsEnum.five;

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
            RechargeAmountWidget(callback: (value) {
            amountsEnum = value;
            },),
            const SizedBox(height: 8),
            const Column(
              children: [
                Text("Available Amount:"),
                Text("AED 100", style: textStyleNormalBoldBlack),
              ],
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => navigateToConfirmation(
                  context,
                  ModelConfirmationPage(
                      beneficiary: widget.data, amountEnum: amountsEnum)),
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

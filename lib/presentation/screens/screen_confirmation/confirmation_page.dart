import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_confirmation/model_confirmation_page.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/text_styles.dart';

class ConfirmationPage extends StatefulWidget {
  final ModelConfirmationPage data;

  const ConfirmationPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _ConfirmationPage();
}

class _ConfirmationPage extends State<ConfirmationPage> {
  int availableAmount = 100;
  int chargeAmount = 1;
  var totalCharges = 0;

  @override
  Widget build(BuildContext context) {
    totalCharges = (availableAmount -
        (chargeAmount + widget.data.amountEnum.amount));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: const Text("Confirmation"),
      ),
      body: body(context),
    );
  }

  Padding body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Name:"),
              const SizedBox(width: 8),
              Text(widget.data.beneficiary.name,
                  style: textStyleNormalBoldBlue),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Number:"),
              const SizedBox(width: 8),
              Text(
                widget.data.beneficiary.phone,
                style: textStyleNormalBoldBlack,
              ),
            ],
          ),
          const Divider(height: 20, color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Available Amount:"),
              const SizedBox(width: 8),
              Text("Aed $availableAmount"),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Topup Amount:"),
              const SizedBox(width: 8),
              Text(widget.data.amountEnum.text, style: textStyleError),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Charges:"),
              const SizedBox(width: 8),
              Text("Aed $chargeAmount", style: textStyleError),
            ],
          ),
          const Divider(height: 20, color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Balance Amount:"),
              const SizedBox(width: 8),
              Text("Aed $totalCharges"),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FilledButton(onPressed: () {}, child: const Text("Yallah")),
            ],
          ),
        ],
      ),
    );
  }
}

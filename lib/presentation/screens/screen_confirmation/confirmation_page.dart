import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/data/db/app_db.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_user.dart';
import 'package:mobile_recharge_app/navigation/routes.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_confirmation/model_confirmation_page.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/text_styles.dart';

class ConfirmationPage extends StatefulWidget {
  final ModelConfirmationPage data;

  const ConfirmationPage({super.key, required this.data});

  @override
  State<StatefulWidget> createState() => _ConfirmationState();
}

class _ConfirmationState extends State<ConfirmationPage> {
  AppDb db = AppDb.instance;

  User user = User(
    id: 1,
    availableAmount: 100,
    spentAmount: 0,
    maxMonthlyAmount: 50,
    maxPerBeneficiaryAmount: 10,
  );
  int chargeAmount = 1;
  var totalCharges = 0;
  var balanceAmount = 0;
  bool success = false;

  @override
  void initState() {
    _readUserFromDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    totalCharges = chargeAmount + widget.data.amountEnum.amount;
    balanceAmount = user.availableAmount - totalCharges;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Confirmation"),
      ),
      body: body(context),
    );
  }

  _readUserFromDb() {
    db.readUser().then((value) {
      setState(() {
        user = value;
      });
    });
  }

  Padding body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: success
          ? successwidget(context)
          : Column(
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
                    Text("Aed ${user.availableAmount}"),
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
                    Text("Aed $balanceAmount"),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FilledButton(
                        onPressed: () async {
                          var future =
                              await db.updateAvailableAmount(balanceAmount);

                          if (1 == future) {
                            _readUserFromDb();

                            setState(() {
                              success = true;
                            });
                          }
                        },
                        child: const Text("Yallah")),
                  ],
                ),
              ],
            ),
    );
  }

  Column successwidget(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check,
                size: 100,
                color: Colors.green,
              ),
            ],
          ),
          const Text("Success"),
          const SizedBox(height: 32),
          FilledButton(
              onPressed: () {
                navigateToHome(context);
              },
              child: const Text("Done")),
        ]);
  }
}

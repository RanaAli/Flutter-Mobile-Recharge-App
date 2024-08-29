import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/data/db/app_db.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_user.dart';
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
  AmountsEnum? amountsEnum;
  AppDb db = AppDb.instance;
  User _user = User(
    id: 1,
    availableAmount: 0,
    spentAmount: 0,
    maxMonthlyAmount: 0,
    maxPerBeneficiaryAmount: 0,
  );

  _readUserFromDb() {
    db.readUser().then((value) {
      setState(() {
        _user = value;
      });
    });
  }

  @override
  void initState() {
    _readUserFromDb();
    super.initState();
  }

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
            RechargeAmountWidget(
                user: _user,
                callback: (value) {
                  amountsEnum = value;
                }),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text("Available Amount:", style: textStyleSmallGrey),
                    Text("AED ${_user.availableAmount}",
                        style: textStyleNormalBoldBlack),
                  ],
                ),
                Column(
                  children: [
                    const Text("Total Amount Spent:",
                        style: textStyleSmallGrey),
                    Text("AED ${_user.spentAmount}",
                        style: textStyleNormalBoldBlack),
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            if (!isButtonEnabled(AmountsEnum.five))
              const Text(
                "You have reached your max monthly limit!",
                style: textStyleError,
              ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => {
                if (amountsEnum != null)
                  navigateToConfirmation(
                    context,
                    ModelConfirmationPage(
                        beneficiary: widget.data, amountEnum: amountsEnum!),
                  )
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }

  bool isButtonEnabled(AmountsEnum amountEnum) {
    return ((amountEnum.amount <= _user.availableAmount) &&
        (amountEnum.amount <= _user.maxMonthlyAmount - _user.spentAmount));
  }
}

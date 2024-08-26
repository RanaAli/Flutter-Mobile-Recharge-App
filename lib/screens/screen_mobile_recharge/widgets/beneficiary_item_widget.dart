import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/navigation/routes.dart';
import 'package:mobile_recharge_app/ui_elements/button_styles.dart';
import 'package:mobile_recharge_app/ui_elements/text_styles.dart';

class BeneficiaryItemWidget extends StatelessWidget {
  const BeneficiaryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Rana Ahsan Ali", style: textStyleNormalBoldBlue),
            const SizedBox(height: 4),
            const Text("+971554623827", style: textStyleSmallGrey),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => navigateToAmountSelection(context),
              style: buttonStyleBlue,
              child: const Text("Recharge Now", style: textStyleWhite),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/navigation/routes.dart';
import 'package:mobile_recharge_app/ui_elements/button_styles.dart';
import 'package:mobile_recharge_app/ui_elements/text_styles.dart';

class BeneficiaryItemWidget extends StatefulWidget {
  final ModelBeneficiary data;

  @override
  State<StatefulWidget> createState() => _BeneficiaryItemState();

  const BeneficiaryItemWidget({
    super.key,
    required this.data,
  });
}

class _BeneficiaryItemState extends State<BeneficiaryItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.data.name,
              style: textStyleNormalBoldBlue,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 4),
            Text(
              widget.data.phone.toString(),
              style: textStyleSmallGrey,
              textAlign: TextAlign.center,
            ),
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

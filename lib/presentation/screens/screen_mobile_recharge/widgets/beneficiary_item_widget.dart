import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/navigation/routes.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/button_styles.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/text_styles.dart';

class BeneficiaryItemWidget extends StatefulWidget {
  final ModelBeneficiary data;

  const BeneficiaryItemWidget({
    super.key,
    required this.data,
  });

  @override
  State<StatefulWidget> createState() => _BeneficiaryItemState();
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
            Text(
              widget.data.pastToppedUpAmount.toString(),
              style: const TextStyle(
                fontSize: 10,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed: () => navigateToAmountSelection(context, widget.data),
              style: buttonStyleBlue,
              child: const Text("Recharge Now", style: textStyleWhite),
            )
          ],
        ),
      ),
    );
  }
}

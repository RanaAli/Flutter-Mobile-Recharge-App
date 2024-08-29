import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_user.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_amount_selection/widgets/amounts_enum.dart';

class RechargeAmountWidget extends StatefulWidget {
  final Function(AmountsEnum?) callback;
  final User user;

  const RechargeAmountWidget(
      {super.key, required this.user, required this.callback});

  @override
  State<RechargeAmountWidget> createState() => _RechargeAmountWidgetState();
}

class _RechargeAmountWidgetState extends State<RechargeAmountWidget> {
  AmountsEnum? selection;

  @override
  Widget build(BuildContext context) {
    if ((selection == null) &&
        (AmountsEnum.five.amount <=
            widget.user.maxMonthlyAmount - widget.user.spentAmount)) {
      widget.callback(AmountsEnum.five);
      selection = AmountsEnum.five;
      print("in if");
    }

    return Column(
      children: <Widget>[
        amountListTile(AmountsEnum.five),
        amountListTile(AmountsEnum.ten),
        amountListTile(AmountsEnum.twenty),
        amountListTile(AmountsEnum.thirty),
        amountListTile(AmountsEnum.fifty),
        amountListTile(AmountsEnum.seventyFive),
        amountListTile(AmountsEnum.hundred),
      ],
    );
  }

  Column amountListTile(AmountsEnum amountEnum) {
    return Column(
      children: [
        ListTile(
          enabled: isButtonEnabled(amountEnum),
          onTap: () {
            setState(() {
              selection = amountEnum;
            });
          },
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(amountEnum.text),
          leading: Radio<AmountsEnum>(
            value: amountEnum,
            groupValue: selection,
            onChanged: (AmountsEnum? value) {
              if (isButtonEnabled(amountEnum)) {
                setState(() {
                  widget.callback(value);
                  selection = value;
                });
              }
            },
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  bool isButtonEnabled(AmountsEnum amountEnum) {
    return ((amountEnum.amount <= widget.user.availableAmount) &&
            (amountEnum.amount <=
                widget.user.maxMonthlyAmount - widget.user.spentAmount));
  }
}

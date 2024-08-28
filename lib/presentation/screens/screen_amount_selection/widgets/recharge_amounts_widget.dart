import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_amount_selection/widgets/amounts_enum.dart';

class RechargeAmountWidget extends StatefulWidget {
  final Function(AmountsEnum) callback;

  const RechargeAmountWidget({super.key, required this.callback});

  @override
  State<RechargeAmountWidget> createState() => _RechargeAmountWidgetState();
}

class _RechargeAmountWidgetState extends State<RechargeAmountWidget> {
  AmountsEnum? selection = AmountsEnum.five;

  @override
  Widget build(BuildContext context) {
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

  Column amountListTile(AmountsEnum value) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            setState(() {
              selection = value;
            });
          },
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(value.value),
          leading: Radio<AmountsEnum>(
            value: value,
            groupValue: selection,
            onChanged: (AmountsEnum? value) {
              setState(() {
                widget.callback(value!);
                selection = value;
              });
            },
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_amount_selection/widgets/amounts_enum.dart';

class RechargeAmountWidget extends StatefulWidget {
  const RechargeAmountWidget({super.key});

  @override
  State<RechargeAmountWidget> createState() => _RechargeAmountWidgetState();
}

class _RechargeAmountWidgetState extends State<RechargeAmountWidget> {
  AmountsEnum? _character = AmountsEnum.five;

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
              _character = value;
            });
          },
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(8),
          ),
          title: Text(value.text),
          leading: Radio<AmountsEnum>(
            value: value,
            groupValue: _character,
            onChanged: (AmountsEnum? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}

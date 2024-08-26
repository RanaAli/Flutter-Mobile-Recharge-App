import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/screens/screen_add_beneficiary/add_beneficiary_page.dart';
import 'package:mobile_recharge_app/screens/screen_amount_selection/amount_selection_page.dart';

void navigateToAmountSelection(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AmountSelectionPage()));
}

void navigateToAddBeneficiary(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AddBeneficiaryPage()));
}

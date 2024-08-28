import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_add_beneficiary/add_beneficiary_page.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_amount_selection/amount_selection_page.dart';

void navigateToAmountSelection(BuildContext context, ModelBeneficiary ben) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AmountSelectionPage(data: ben)));
}

void navigateToAddBeneficiary(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AddBeneficiaryPage()));
}

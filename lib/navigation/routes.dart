import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_add_beneficiary/add_beneficiary_page.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_amount_selection/amount_selection_page.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_confirmation/confirmation_page.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_confirmation/model_confirmation_page.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_mobile_recharge/mobile_recharge_page.dart';

void navigateToBenSelectScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const MobileRechargePage()));
}

void navigateToAmountSelection(BuildContext context, ModelBeneficiary ben) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => AmountSelectionPage(data: ben)));
}

void navigateToAddBeneficiary(BuildContext context) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const AddBeneficiaryPage()));
}

void navigateToConfirmation(BuildContext context, ModelConfirmationPage data) {
  Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ConfirmationPage(data: data)));
}

void navigateToHome(BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const MobileRechargePage()),
      ModalRoute.withName('/'));
}

import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_amount_selection/widgets/amounts_enum.dart';

class ModelConfirmationPage {
  final ModelBeneficiary beneficiary;
  final AmountsEnum amountEnum;

  ModelConfirmationPage({
    required this.beneficiary,
    required this.amountEnum,
  });

}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_recharge_app/data/db/app_db.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/data/remote/api_service.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/button_styles.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/my_app_bar.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/text_styles.dart';

class AddBeneficiaryPage extends StatefulWidget {
  const AddBeneficiaryPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddBeneficiaryPage();
}

class _AddBeneficiaryPage extends State<AddBeneficiaryPage> {
  AppDb db = AppDb.instance;

  final TextEditingController nameTextFieldController = TextEditingController();
  final TextEditingController phoneTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getDefaultAppBar(context, "Add Beneficiary"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Name", style: textStyleNormalBoldBlack),
              TextField(
                controller: nameTextFieldController,
                style: textStyleSmallGrey,
                inputFormatters: [LengthLimitingTextInputFormatter(20)],
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 8),
              const Text("Phone Number", style: textStyleNormalBoldBlack),
              TextField(
                controller: phoneTextFieldController,
                style: textStyleSmallGrey,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FilledButton(
                    onPressed: () async {
                      var beneficiary = ModelBeneficiary(
                        name: nameTextFieldController.text,
                        phone: int.parse(phoneTextFieldController.text),
                      );

                      final response = await ApiService.instance
                          .createBeneficiaries(beneficiary);

                      if (response.statusCode == 200) {
                        await db.create(beneficiary);
                        printModels(db);
                        Navigator.of(context).pop('done');
                      }
                    },
                    style: buttonStyleBlue,
                    child: const Text("Add"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

Future<void> printModels(AppDb db) async {
  print(await db.readAll());
}

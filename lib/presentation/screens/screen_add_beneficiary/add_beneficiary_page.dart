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

  bool showLoading = false;

  String? _nameErrorText;
  String? _phoneErrorText;

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
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Name',
                  errorText: _nameErrorText,
                ),
              ),
              const SizedBox(height: 8),
              const Text("Phone Number", style: textStyleNormalBoldBlack),
              TextField(
                controller: phoneTextFieldController,
                style: textStyleSmallGrey,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'Phone Number',
                  errorText: _phoneErrorText,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (showLoading &&
                      _phoneErrorText == null &&
                      _nameErrorText == null)
                    const CircularProgressIndicator()
                  else
                    FilledButton(
                      onPressed: () async {
                        setState(() {
                          _phoneErrorText = validateTextField(
                              phoneTextFieldController.value.text);
                          _nameErrorText = validateTextField(
                              nameTextFieldController.value.text);
                        });

                        if (_phoneErrorText == null && _nameErrorText == null) {
                          setState(
                            () {
                              showLoading = true;
                            },
                          );
                          var beneficiary = ModelBeneficiary(
                            name: nameTextFieldController.text,
                            phone: phoneTextFieldController.text,
                          );

                          final response = await ApiService.instance
                              .createBeneficiaries(beneficiary);

                          if (response.statusCode == 200) {
                            await db.create(beneficiary);
                            setState(() {
                              showLoading = false;
                            });
                            printModels(db);
                            Navigator.of(context).pop('done');
                          }
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

String? validateTextField(String value) {
  if (value.isEmpty) {
    return "Required";
  }
  return null;
}

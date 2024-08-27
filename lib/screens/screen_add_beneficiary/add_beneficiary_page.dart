import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/db/app_db.dart';
import 'package:mobile_recharge_app/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/ui_elements/button_styles.dart';
import 'package:mobile_recharge_app/ui_elements/my_app_bar.dart';
import 'package:mobile_recharge_app/ui_elements/text_styles.dart';

class AddBeneficiaryPage extends StatefulWidget {
  const AddBeneficiaryPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddBeneficiaryPage();
}

class _AddBeneficiaryPage extends State<AddBeneficiaryPage> {
  AppDb db = AppDb.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: getDefaultAppBar(context, "Add Beneficiary"),
        body: body(context, db));
  }
}

Padding body(BuildContext context, AppDb db) {
  printModels(db);
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Name", style: textStyleNormalBoldBlack),
        const TextField(
          obscureText: true,
          style: textStyleSmallGrey,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Name',
          ),
        ),
        const SizedBox(height: 8),
        const Text("Phone Number", style: textStyleNormalBoldBlack),
        const TextField(
          obscureText: true,
          style: textStyleSmallGrey,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Phone Number',
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FilledButton(
              onPressed: () {
                db.create(ModelBeneficiary(name: 'Rana', phone: 123));

                printModels(db);
                Navigator.of(context).pop('done');
              },
              style: buttonStyleBlue,
              child: const Text("Add"),
            ),
          ],
        ),
      ],
    ),
  );
}

Future<void> printModels(AppDb db) async {
  print(await db.readAll());
}

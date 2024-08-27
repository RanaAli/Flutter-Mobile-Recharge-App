import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/db/app_db.dart';
import 'package:mobile_recharge_app/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/screens/screen_add_beneficiary/add_beneficiary_page.dart';
import 'package:mobile_recharge_app/screens/screen_mobile_recharge/widgets/beneficiary_item_widget.dart';
import 'package:mobile_recharge_app/ui_elements/my_app_bar.dart';

class MobileRechargePage extends StatefulWidget {
  const MobileRechargePage({super.key});

  @override
  State<MobileRechargePage> createState() => _MobileRechargePage();
}

class _MobileRechargePage extends State<MobileRechargePage> {
  AppDb db = AppDb.instance;
  List<ModelBeneficiary> list = [];

  @override
  void initState() {
    refreshBeneficiaries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDefaultAppBar(context, "Select Beneficiary"),
      body: body(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo.shade400,
        tooltip: 'Add Beneficiary',
        onPressed: () => navigate(context),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  void navigate(BuildContext context) async {
    Navigator.of(context)
        .push(
            MaterialPageRoute(builder: (context) => const AddBeneficiaryPage()))
        .then((value) {
      refreshBeneficiaries();
    });
  }

  refreshBeneficiaries() {
    db.readAll().then((value) {
      setState(() {
        list = value;
      });
    });
  }

  Center body(BuildContext context) {
    return Center(
      heightFactor: 1,
      child: list.isEmpty
          ? const Text(
              'No Notes yet',
              style: TextStyle(color: Colors.black),
            )
          : CarouselSlider(
              options: CarouselOptions(
                height: 130,
                enableInfiniteScroll: false,
                initialPage: 0,
                enlargeCenterPage: false,
                viewportFraction: 0.4,
                disableCenter: true,
                padEnds: false,
                pageSnapping: true,
              ),
              items: list.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: BeneficiaryItemWidget(data: i),
                    );
                  },
                );
              }).toList(),
            ),
    );
  }
}

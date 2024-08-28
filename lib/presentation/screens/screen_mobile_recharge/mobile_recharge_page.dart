import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/data/db/app_db.dart';
import 'package:mobile_recharge_app/data/db/db_models/model_beneficiary.dart';
import 'package:mobile_recharge_app/data/remote/api_service.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_add_beneficiary/add_beneficiary_page.dart';
import 'package:mobile_recharge_app/presentation/screens/screen_mobile_recharge/widgets/beneficiary_item_widget.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/my_app_bar.dart';
import 'package:mobile_recharge_app/presentation/ui_elements/text_styles.dart';

class MobileRechargePage extends StatefulWidget {
  const MobileRechargePage({super.key});

  @override
  State<MobileRechargePage> createState() => _MobileRechargePage();
}

class _MobileRechargePage extends State<MobileRechargePage> {
  AppDb db = AppDb.instance;

  List<ModelBeneficiary> list = [];
  bool loading = false;

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
        floatingActionButton:
            // list.length < 5
            //     ?
            FloatingActionButton(
          backgroundColor: Colors.indigo.shade400,
          tooltip: 'Add Beneficiary',
          onPressed: () => navigate(context),
          child: const Icon(Icons.add, color: Colors.white, size: 28),
        )
        // : null,
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

  refreshBeneficiaries() async {
    loading = true;
    final response = await ApiService.instance.getBeneficiaries();

    if (response.statusCode == 200) {
      setState(() {
        list = ModelBeneficiary.fromJSonToList(response.data);
      });
    }

    loading = false;

    db.readAll().then((value) {
      setState(() {
        list = value;
      });
    });
  }

  Center body(BuildContext context) {
    if (loading) {
      return Center(
        heightFactor: 1,
        child: Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      );
    }

    return Center(
      heightFactor: 1,
      child: list.isEmpty
          ? Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: const Text(
                'No Beneficiaries added yet. \n Click on + button to add one.',
                style: textStyleNormalBoldBlack,
                textAlign: TextAlign.center,
              ),
            )
          : Column(
              children: [
                CarouselSlider(
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
                const SizedBox(height: 16),
                if (list.length >= 5)
                  const Text(
                    "You have reached max limit of Beneficiaries.",
                    style: textStyleError,
                  ),
              ],
            ),
    );
  }
}

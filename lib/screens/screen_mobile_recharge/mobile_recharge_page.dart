import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/navigation/routes.dart';
import 'package:mobile_recharge_app/ui_elements/my_app_bar.dart';
import 'package:mobile_recharge_app/screens/screen_mobile_recharge/widgets/beneficiary_item_widget.dart';

class MobileRechargePage extends StatefulWidget {
  const MobileRechargePage({super.key});

  @override
  State<MobileRechargePage> createState() => _MobileRechargePage();
}

class _MobileRechargePage extends State<MobileRechargePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getDefaultAppBar(context, "Select Beneficiary"),
      body: body(context),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo.shade400,
        tooltip: 'Add Beneficiary',
        onPressed: () => navigateToAddBeneficiary(context),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
    );
  }

  CarouselSlider body(BuildContext context) {
    return CarouselSlider(
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
      items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: const BeneficiaryItemWidget(),
            );
          },
        );
      }).toList(),
    );
  }
}

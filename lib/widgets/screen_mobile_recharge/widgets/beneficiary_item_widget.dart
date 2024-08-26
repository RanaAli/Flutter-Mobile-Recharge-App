import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/widgets/screen_amount_selection/amount_selection_page.dart';

class BeneficiaryItemWidget extends StatelessWidget {
  const BeneficiaryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Rana Ahsan Ali",
              style: TextStyle(
                color: Colors.indigo.shade400,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "+971554623827",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AmountSelectionPage()));
              },
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    WidgetStateProperty.all<Color>(Colors.indigo.shade400),
              ),
              child: const Text("Recharge Now",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  )),
            )
          ],
        ),
      ),
    );
  }
}

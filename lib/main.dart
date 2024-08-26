import 'package:flutter/material.dart';
import 'package:mobile_recharge_app/widgets/login_screen/login_page.dart';
import 'package:mobile_recharge_app/widgets/mobile_recharge_screen/mobile_recharge_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mobile Recharge App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: body(context),
//     );
//   }
//
//   CarouselSlider body(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 130,
//         enableInfiniteScroll: false,
//         initialPage: 0,
//         enlargeCenterPage: false,
//         viewportFraction: 0.4,
//         disableCenter: true,
//         padEnds: false,
//         pageSnapping: true,
//       ),
//       items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((i) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//               width: MediaQuery.of(context).size.width,
//               decoration: const BoxDecoration(color: Colors.transparent),
//               child: const BeneficiaryItemWidget(),
//             );
//           },
//         );
//       }).toList(),
//     );
//   }
// }

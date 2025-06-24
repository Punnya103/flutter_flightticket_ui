import 'package:flight_booking/utils/responsive.dart';
import 'package:flight_booking/views/main/web_scaffold.dart';
import 'package:flutter/material.dart';

import 'tablet_scaffold.dart';
import '../HomeScreen/Home_mob.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> labels = ["Home", "Search", "Tickets", "Profile"];
    final List<Widget> pages = const [
      HomeMob(),
      Center(child: Text("Search", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
      Center(child: Text("Tickets", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
      Center(child: Text("Profile", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
    ];

    if (Responsive.isLargeScreen(context) || Responsive.isLaptop(context)) {
      return WebScaffold(labels: labels, pages: pages);
    }else {
      return const MobileScaffold();
    }
  }
}

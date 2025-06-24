import 'package:flight_booking/utils/responsive.dart';
import 'package:flight_booking/views/ProfileScreen/profile_large.dart';
import 'package:flight_booking/views/SearchScreen/search_large.dart';
import 'package:flight_booking/views/Ticket/ticket_large.dart';
import 'package:flight_booking/views/main/mobile_scaffold.dart';
import 'package:flight_booking/views/main/web_scaffold.dart';
import 'package:flight_booking/views/ProfileScreen/profile_screen.dart';
import 'package:flight_booking/views/SearchScreen/search_screen.dart';
import 'package:flight_booking/views/Ticket/ticket_screen.dart';
import 'package:flutter/material.dart';
import '../HomeScreen/Home_mob.dart';

class MainScaffold extends StatelessWidget {
  const MainScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> labels = ["Home", "Search", "Tickets", "Profile"];
   final List<Widget> pages = const [
  HomeMob(),
  SearchLarge(),
  TicketLarge(),
  ProfileLarge(),
];


    if (Responsive.isLargeScreen(context) || Responsive.isLaptop(context)) {
      return WebScaffold(labels: labels, pages: pages);
    }else {
      return const MobileScaffold();
    }
  }
}

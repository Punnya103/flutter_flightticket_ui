import 'package:flight_booking/utils/app_info_list.dart';
import 'package:flight_booking/widgets/ticketview.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flight_booking/widgets/thick_container.dart';

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FD),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6FD),
        elevation: 0,
        title: const Text(
          "Tickets",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Tabs
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      alignment: Alignment.center,
                      child: const Text("Upcoming"),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.center,
                      child: const Text(
                        "Previous",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),

            // Ticket Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  // Top row with route
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("NYC", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Text("New-York", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      const Spacer(),
                      const ThickContainer(color: Colors.black),

                      Expanded(
                        flex: 2,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 24,
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Flex(
                                    direction: Axis.horizontal,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: List.generate(
                                      (constraints.constrainWidth() / 6).floor(),
                                      (index) => const SizedBox(
                                        width: 3,
                                        height: 1,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Colors.black26,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Transform.rotate(
                              angle: 1.5,
                              child: const Icon(Icons.local_airport_rounded, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const ThickContainer(color: Colors.black),
                      const Spacer(),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("LDN", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          Text("London", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const Gap(20),

                  // Date / Time / Number
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("1 May", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Date", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Column(
                        children: [
                          Text("08:00 AM", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Departure time", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("23", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Number", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const Gap(24),

                  // Passenger / Passport
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Flutter Dash", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Passenger", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("5221 478566", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Passport", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const Gap(24),

                  // E-ticket / Booking code
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("0055 444 77147", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Number of E-ticket", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("B2SG28", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Booking code", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const Gap(16),

                  // Dotted Divider
                  Row(
                    children: List.generate(
                      50,
                      (index) => Expanded(
                        child: Container(
                          height: 1,
                          color: index.isEven ? Colors.transparent : Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                  const Gap(16),

                  // Payment / Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("VISA *** 2462", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Payment method", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("\$249.99", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text("Price", style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                  const Gap(24),

                  // Barcode
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: BarcodeWidget(
                      barcode: Barcode.code128(),
                      data: 'https://github.com/martinovovo',
                      drawText: false,
                      color: Colors.black,
                      width: double.infinity,
                      height: 60,
                    ),
                  ),
                ],
              ),
            ),
const Gap(40),
ScrollConfiguration(
  behavior: const ScrollBehavior().copyWith(
    scrollbars: false, // Hide scrollbar
    dragDevices: {
      PointerDeviceKind.mouse,
      PointerDeviceKind.touch,
      PointerDeviceKind.stylus,
      PointerDeviceKind.trackpad,
    },
  ),
  child: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.only(left: 20),
    child: Row(
      children: ticketList
          .map((ticket) => TicketView(ticket: ticket))
          .toList(),
    ),
  ),
),

          ],
        ),
      ),
    );
  }
}

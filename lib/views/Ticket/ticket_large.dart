import 'dart:ui';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:flight_booking/utils/app_info_list.dart';
import 'package:flight_booking/widgets/ticketview.dart';
import 'package:flight_booking/widgets/thick_container.dart';

class TicketLarge extends StatefulWidget {
  const TicketLarge({super.key});

  @override
  State<TicketLarge> createState() => _TicketLargeState();
}

class _TicketLargeState extends State<TicketLarge> {
  Map<String, dynamic>? selectedTicket;

  @override
  void initState() {
    super.initState();
    final today = DateTime(2025, 6, 24);
    selectedTicket = ticketList.firstWhere(
      (t) => DateTime.parse(t['date']).isAfter(today),
      orElse: () => ticketList.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateTime today = DateTime(2025, 6, 24);

    final Set<String> seen = {};
    final uniqueTickets = ticketList.where((ticket) {
      final key = '${ticket['number']}_${ticket['date']}';
      if (seen.contains(key)) return false;
      seen.add(key);
      return true;
    }).toList();

    final upcoming = uniqueTickets.where((t) => DateTime.parse(t['date']).isAfter(today)).toList();
    final previous = uniqueTickets.where((t) => DateTime.parse(t['date']).isBefore(today)).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF0F3FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF0F3FA),
        elevation: 0,
        title: const Text(
          "Tickets",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // LEFT: Ticket Details
            Expanded(
              flex: 4,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 580,
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 12)],
                ),
                child: selectedTicket == null
                    ? const Center(child: Text("No ticket selected"))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Ticket Details",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          const Gap(16),
                          Row(
                            children: [
                              _airportInfo(selectedTicket!['from']),
                              const Spacer(),
                              const ThickContainer(color: Colors.black),
                              _dashedLine(),
                              const ThickContainer(color: Colors.black),
                              const Spacer(),
                              _airportInfo(selectedTicket!['to'], isEnd: true),
                            ],
                          ),
                          const Gap(20),
                          _ticketFieldRow("Date", selectedTicket!['date'],
                              "Time", selectedTicket!['departure_time'],
                              "Flight", selectedTicket!['number']),
                          const Gap(16),
                          _ticketFieldRow("Passenger", "Flutter Dash",
                              "Passport", "5221 478566",
                              "Flying Time", selectedTicket!['flying_time']),
                          const Gap(16),
                          _ticketFieldRow("E-ticket", "0055 444 77147",
                              "Booking Code", "B2SG28",
                              "Price", "\$249.99"),
                          const Gap(24),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              // color: Colors.grey.shade100,
                            ),
                            child: BarcodeWidget(
                              barcode: Barcode.code128(),
                              data: selectedTicket!['number'],
                              drawText: false,
                              color: Colors.black87,
                              width: double.infinity,
                              height: 60,
                            ),
                          ),
                        ],
                      ),
              ),
            ),

            // MIDDLE: Upcoming & Previous Horizontal
            Expanded(
              flex: 3,
              child: SizedBox(
                height: 580,
                child: Column(
                  children: [
                    // Upcoming
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Upcoming", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const Divider(thickness: 1.2, height: 16),
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: const ScrollBehavior().copyWith(
                                scrollbars: false,
                                dragDevices: {
                                  PointerDeviceKind.mouse,
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.stylus,
                                  PointerDeviceKind.trackpad,
                                },
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.only(left: 8, right: 12),
                                child: Row(
                                  children: upcoming.map((ticket) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: GestureDetector(
                                        onTap: () => setState(() => selectedTicket = ticket),
                                        child: TicketView(
                                          ticket: ticket,
                                          isSelected: ticket == selectedTicket,
                                          isCompact: true,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Previous
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Previous", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const Divider(thickness: 1.2, height: 16),
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: const ScrollBehavior().copyWith(
                                scrollbars: false,
                                dragDevices: {
                                  PointerDeviceKind.mouse,
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.stylus,
                                  PointerDeviceKind.trackpad,
                                },
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                padding: const EdgeInsets.only(left: 8, right: 12),
                                child: Row(
                                  children: previous.map((ticket) {
                                    return Padding(
                                      padding: const EdgeInsets.only(right: 16),
                                      child: GestureDetector(
                                        onTap: () => setState(() => selectedTicket = ticket),
                                        child: TicketView(
                                          ticket: ticket,
                                          isSelected: ticket == selectedTicket,
                                          isCompact: true,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // RIGHT: Summary Box
            Expanded(
              flex: 2,
              child: Container(
                height: 580,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.blueGrey.shade100),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Summary", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const Gap(24),
                    _summaryBox("Total Flights", uniqueTickets.length.toString()),
                    _summaryBox("Upcoming Flights", upcoming.length.toString()),
                    _summaryBox("Previous Flights", previous.length.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryBox(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E8F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }

  Widget _airportInfo(Map<String, String> data, {bool isEnd = false}) {
    return Column(
      crossAxisAlignment: isEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(data['code']!, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        Text(data['name']!, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _ticketFieldRow(String label1, String value1, String label2, String value2, String label3, String value3) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _field(label1, value1),
        _field(label2, value2),
        _field(label3, value3),
      ],
    );
  }

  Widget _field(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }

  Widget _dashedLine() {
    return Expanded(
      flex: 2,
      child: SizedBox(
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
                  child: DecoratedBox(decoration: BoxDecoration(color: Colors.black26)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flight_booking/utils/applayout.dart';
import 'package:flight_booking/utils/appstyle.dart';
import 'package:flight_booking/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool isSelected;
  final bool isCompact;

  const TicketView({
    super.key,
    required this.ticket,
    this.isSelected = false,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = AppLayout.getResponsiveWidth(context);
    final height = AppLayout.getResponsiveHeight(context);
    final double tileHeight = isCompact ? height * 0.5 : height * 0.8;

    return Container(
      width: width,
      height: tileHeight,
 
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.blueAccent : Colors.transparent,
          width: 2,
          
        ),
        borderRadius: BorderRadius.circular(21),
      ),
      child: Column(
        children: [
          // Blue section
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF526799),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(21),
                topRight: Radius.circular(21),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(ticket['from']['code'],
                        style: Styles.headLinestyle3.copyWith(color: Colors.white)),
                    const Spacer(),
                    const ThickContainer(color: Colors.white),
                    Expanded(
                      child: Stack(
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
                                      child: DecoratedBox(decoration: BoxDecoration(color: Colors.white)),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                           Center(
                            child: Transform.rotate(
                              angle: 1.5,
                              child: Icon(Icons.local_airport_rounded, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const ThickContainer(color: Colors.white),
                    const Spacer(),
                    Text(ticket['to']['code'],
                        style: Styles.headLinestyle3.copyWith(color: Colors.white)),
                  ],
                ),
                const Gap(3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 100,
                      child: Text(ticket['from']['name'],
                          style: Styles.headLinestyle4.copyWith(color: Colors.white)),
                    ),
                    Text(ticket['flying_time'],
                        style: Styles.headLinestyle4.copyWith(color: Colors.white)),
                    SizedBox(
                      width: 100,
                      child: Text(ticket['to']['name'],
                          textAlign: TextAlign.end,
                          style: Styles.headLinestyle4.copyWith(color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Orange separator
          Container(
            color: Styles.orangeColor,
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 20,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        int dashCount = (constraints.maxWidth / 6).floor();
                        return Flex(
                          direction: Axis.horizontal,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            dashCount,
                            (index) => const SizedBox(
                              width: 3,
                              height: 1,
                              child: DecoratedBox(
                                decoration: BoxDecoration(color: Colors.white),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                  width: 10,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Styles.bgColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Orange bottom section
          Container(
            decoration: BoxDecoration(
              color: Styles.orangeColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(21),
                bottomRight: Radius.circular(21),
              ),
            ),
            padding: const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _infoColumn("Date", ticket['date']),
                    _infoColumn("Departure time", ticket['departure_time']),
                    _infoColumn("Number", ticket['number']),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(value, style: Styles.headLinestyle3.copyWith(color: Colors.white)),
        const Gap(5),
        Text(title, style: Styles.headLinestyle4.copyWith(color: Colors.white)),
      ],
    );
  }
}


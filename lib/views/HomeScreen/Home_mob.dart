import 'package:flight_booking/utils/app_info_list.dart';
import 'package:flight_booking/utils/appstyle.dart';
import 'package:flight_booking/utils/responsive.dart';
import 'package:flight_booking/widgets/hotel_list.dart';
import 'package:flight_booking/widgets/ticketview.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeMob extends StatelessWidget {
  const HomeMob({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              children: [
                const Gap(16),
                const Gap(10),

                Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFF4F6FD),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              FluentSystemIcons.ic_fluent_search_regular,
                              color: Color(0xFFBFC205),
                            ),
                            SizedBox(width: 8),
                            Text("Search"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/img1.jpeg"),
                    ),
                  ],
                ),

                const Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Upcoming Flights', style: Styles.headLinestyle2),
                    InkWell(
                      onTap: () {
                        print("you are trapped");
                      },
                      child: Text(
                        'View All',
                        style: Styles.textStyle.copyWith(
                          color: Styles.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          ScrollConfiguration(
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
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: ticketList
                    .map((ticket) => TicketView(ticket: ticket))
                    .toList(),
              ),
            ),
          ),

          const Gap(5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hotels', style: Styles.headLinestyle2),
                InkWell(
                  onTap: () {
                    print("you are trapped");
                  },
                  child: Text(
                    'View All',
                    style: Styles.textStyle.copyWith(
                      color: Styles.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          ScrollConfiguration(
            behavior: const ScrollBehavior().copyWith(
              scrollbars: false, // hides the scrollbar
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
                children: hotelList
                    .map((singleHotel) => HotelList(hotel: singleHotel))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

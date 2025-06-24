import 'package:flight_booking/utils/applayout.dart';
import 'package:flight_booking/utils/appstyle.dart';
import 'package:flutter/material.dart';

class HotelList extends StatelessWidget {
  final Map<String, dynamic> hotel;
  const HotelList({super.key, required this.hotel});

  @override
  Widget build(BuildContext context) {
    final width = AppLayout.getResponsiveWidth(context);
    final height = AppLayout.getResponsiveHeight(context) *1.4;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Styles.primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/${hotel['image']}"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Text section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hotel name with overflow handling
                  Text(
                    hotel['place'],
                    style: Styles.headLinestyle2.copyWith(color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Destination
                  Text(
                    hotel['destination'],
                    style: Styles.headLinestyle3.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: 12),

                  // Price
                  Text(
                    '\$${hotel['price']}/night',
                    style: Styles.headLinestyle2.copyWith(color: Colors.amberAccent),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

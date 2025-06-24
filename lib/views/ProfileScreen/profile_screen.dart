import 'package:flight_booking/utils/appstyle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF3B72FF);
    const bgColor = Color(0xFFF4F6FD);
    const cardColor = Colors.white;
    const textColor = Colors.black87;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        // title: const Text(
        //   "Book Tickets",
        //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
        // ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Edit", style: TextStyle(color: primaryColor, fontSize: 16)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Info
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Styles.primaryColor.withOpacity(0.2),
                  child: const Icon(Icons.flight, size: 30, color: primaryColor),
                ),
                const Gap(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("New-York", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Gap(4),
                    Text("Premium status", style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),

            const Gap(20),

            // Award Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Styles.primaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Icon(Icons.lightbulb_outline, color: Colors.white),
                  const Gap(12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "You've got a new award",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Gap(4),
                        Text(
                          "You have 150 flights in a year",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            const Gap(30),

            const Text("Accumulated miles", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            const Gap(10),

            Center(
              child: Text(
                "192802",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Miles accrued", style: TextStyle(color: Colors.grey)),
                Text("23 May 2021", style: TextStyle(color: Colors.grey)),
              ],
            ),

            const Gap(20),

            // Miles entries
            _buildMilesCard("23,042", "Airline CO"),
            const Gap(12),
            _buildMilesCard("24", "McDonald's"),
            const Gap(12),
            _buildMilesCard("52,340", "Exuma"),

            const Gap(28),

            Center(
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  "How to get more miles",
                  style: TextStyle(
                    fontSize: 14,
                    color: primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMilesCard(String miles, String source) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$miles Miles", style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text("Received from", style: TextStyle(fontSize: 12, color: Colors.grey)),
              Text(source, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }
}

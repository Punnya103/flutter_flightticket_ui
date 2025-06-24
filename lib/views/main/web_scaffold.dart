import 'package:flutter/material.dart';

class WebScaffold extends StatefulWidget {
  final List<String> labels;
  final List<Widget> pages;
  final String title;

  const WebScaffold({
    super.key,
    required this.labels,
    required this.pages,
    this.title = "Book Tickets",
  });

  @override
  State<WebScaffold> createState() => _WebScaffoldState();
}

class _WebScaffoldState extends State<WebScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        actions: List.generate(widget.labels.length, (index) {
          final isSelected = _selectedIndex == index;
          return TextButton(
            onPressed: () => _onItemTapped(index),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.labels[index],
                  style: TextStyle(
                    fontSize: 16,
                    color: isSelected ? Colors.blueGrey : Colors.black87,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 2),
                Container(
                  height: 2,
                  width: 30,
                  color: isSelected ? Colors.blueGrey : Colors.transparent,
                ),
              ],
            ),
          );
        }),
      ),
      body: widget.pages[_selectedIndex],
    );
  }
}

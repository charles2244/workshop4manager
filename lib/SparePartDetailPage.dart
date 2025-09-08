import 'package:flutter/material.dart';

class SparePartDetailPage extends StatelessWidget {
  final String name;
  final String location;
  final int quantity;
  final String imagePath;

  const SparePartDetailPage({
    super.key,
    required this.name,
    required this.location,
    required this.quantity,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2c3e50),
      body: Column(
        children: [
          // Top Bar
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 100),
              const Text(
                'Usage History',
                //textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          // Summary Cards
          Container(
            color: const Color(0xFF2c3e50),
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            child: Row(
              children: [
                _summaryCard("Current Quantity", "50"),
                const SizedBox(width: 0),
              ],
            ),
          ),

          // Spare Parts Container
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Spare Parts Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 5),
                            Text(
                              name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Spare Parts List
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.all(0),
                      children: [
                        Text("Usage History"),
                        Container(
                          height: 2, // thickness of the line
                          decoration: BoxDecoration(
                            color: Colors.black, // solid line color
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5), // shadow color
                                spreadRadius: 1,
                                blurRadius: 4,
                                offset: Offset(0, 2), // shadow position
                              ),
                            ],
                          ),
                        ),
                        _sparePartUsage("14/06/2025", "Charles Leong", 2),
                        _sparePartUsage("02/06/2025", "Jeff Tan", 1),
                        _sparePartUsage("13/05/2025", "John Wick", 2),
                        _sparePartUsage("20/04/2025", "Jennie Tan", 3),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Summary Card Widget
  static Widget _summaryCard(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Spare Part Item Widget
  static Widget _sparePartUsage(String date, String mecName, int qty) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(date, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text(
                "Mechanic Name: ",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Expanded(child: Text(mecName, textAlign: TextAlign.right,)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Text(
                "Quantity Used: ",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Expanded(
                child: Text(
                  qty.toString(),
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 2, // thickness of the line
            decoration: BoxDecoration(
              color: Colors.black, // solid line color
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // shadow color
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: Offset(0, 2), // shadow position
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

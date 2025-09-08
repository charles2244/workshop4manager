import 'package:flutter/material.dart';

import 'SparePartDetailPage.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({super.key});

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
                const SizedBox(width: 120),
                const Text(
                  'Inventory',
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              children: [
                _summaryCard("Parts In Stock", "6"),
                const SizedBox(width: 16),
                _summaryCard("Procurement Req.", "5"),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Icon(Icons.settings, size: 18),
                            SizedBox(width: 5),
                            Text(
                              "Spare Parts",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Row(
                          children: const [
                            Text("Qty", style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(width: 5),
                            Icon(Icons.swap_vert, size: 18),
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
                        _sparePartItem(context, "Air Filter", "Main Warehouse", 50, "assets/images/filter.png", onTap: () {print("Brake Pad tapped!");},),
                        _sparePartItem(context, "Brake Pad Set", "Warehouse 3", 60, "assets/images/brake.png", onTap: () {print("Brake Pad tapped!");},),
                        _sparePartItem(context, "Oil Filter", "Main Warehouse", 50, "assets/images/oil.png", onTap: () {print("Brake Pad tapped!");},),
                        _sparePartItem(context, "Rack End", "Warehouse 3", 10, "assets/images/rack.png", onTap: () {print("Brake Pad tapped!");},),
                        _sparePartItem(context, "Spark Plug", "Warehouse 1", 30, "assets/images/plug.png", onTap: () {print("Brake Pad tapped!");},),
                        _sparePartItem(context, "Suspension", "Warehouse 3", 15, "assets/images/suspension.png", onTap: () {print("Brake Pad tapped!");},),
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
  static Widget _sparePartItem(
      BuildContext context,
      String name,
      String location,
      int qty,
      String iconPath, {
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SparePartDetailPage(
              name: name,
              location: location,
              quantity: qty,
              imagePath: iconPath,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue.shade100,
              child: Image.asset(iconPath, width: 24, height: 24),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(
                    "Location: $location",
                    style: const TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                ],
              ),
            ),
            Text(
              qty.toString(),
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

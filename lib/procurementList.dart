import 'package:flutter/material.dart';

import 'ProcurementDetailPage.dart';
import 'ProcurementRequestPage.dart';

class ProcurementPage extends StatelessWidget {
  const ProcurementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2c3e50),
      body: Column(
        children: [
          // Top Bar
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  "Procurement",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Procurement Request Count
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              textAlign: TextAlign.center,
              "Procurement Request \n 5",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // White Container for Procurement List
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  // Procurement List
                  Expanded(
                    child: ListView(
                      children: [
                        _procurementItem("Brake Pad Set", "XYZ Brake Co", "20/06/2025", "Pending", context),
                        _procurementItem("Spark Plug", "Global Spark Sdn. Bhd.", "14/06/2025", "In Transit", context),
                        _procurementItem("Oil Filter", "Auto Parts Supplier", "02/06/2025", "In Transit", context),
                        _procurementItem("Air Filter", "Auto Parts Supplier", "26/05/2025", "Completed", context),
                      ],
                    ),
                  ),

                  // Request Procurement Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProcurementRequestPage()));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      margin: const EdgeInsets.only(top: 10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade300,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          "Request Procurement",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.grey;
      case "In Transit":
        return Colors.yellow;
      case "Completed":
        return Colors.green;
      default:
        return Colors.black; // fallback color
    }
  }

  // Procurement Item Widget
  Widget _procurementItem(String itemName, String supplier, String date, String status, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left side: Item info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemName, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(supplier),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25, right: 6),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: getStatusColor(status),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
            ),
          ),
          // Middle: Date + Status
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(date, style: const TextStyle(fontSize: 12)),
              const SizedBox(height: 6),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProcurementDetailPage(
                        partName: "Brake Pad Set",
                        quantity: 20,
                        requiredDate: "20/06/2025",
                        remarks: "Ensure Parts Are Compatible With Model X, 2021 Edition.",
                        receivedBy: "",
                        status: "Pending",
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Details >",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

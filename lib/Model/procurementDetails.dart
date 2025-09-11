class ProcurementDetails {
  final int id;
  final int quantity;
  final String remarks;
  final DateTime receivedBy;
  final String receivedImage;
  final String procuremtnId;

  ProcurementDetails({
    required this.id,
    required this.quantity,
    required this.remarks,
    required this.receivedBy,
    required this.receivedImage,
    required this.procuremtnId,
  });

  // From JSON (for Supabase or API)
  factory ProcurementDetails.fromJson(Map<String, dynamic> json) {
    return ProcurementDetails(
      id: json['pd_id'] ?? 0,
      quantity: (json['quantity'] ?? 0).toInt(),
      remarks: json['remarks'] ?? 'Unknown',
      receivedBy: json['received_by'] != null
          ? DateTime.parse(json['used_at'].toString())
          : DateTime.now(), // fallback if null
      receivedImage: json['received_image'] ?? ' Image Not Found ',
      procuremtnId: json['procurement_id'] ?? 'Unknown',
    );
  }
}
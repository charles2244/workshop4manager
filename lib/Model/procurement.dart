class Procurement {
  final int id;
  final String spName;
  final String sName;
  final DateTime requestDate;
  final String status;

  Procurement({
    required this.id,
    required this.spName,
    required this.sName,
    required this.requestDate,
    required this.status,
  });

  // From JSON (for Supabase or API)
  factory Procurement.fromJson(Map<String, dynamic> json) {
    return Procurement(
      id: json['procurement_id'] ?? 0,
      spName: json['sparepart_name'] ?? 'Unknown',
      sName: json['supplier_name'] ?? 'Unknown',
      requestDate: json['request_date'] != null
          ? DateTime.parse(json['request_date'].toString())
          : DateTime.now(), // fallback if null
      status: json['status'] ?? 'Unknown',
    );
  }
}

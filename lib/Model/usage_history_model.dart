class UsageHistory {
  final int id;
  final DateTime usedAt;
  final String mechanicName;
  final int quantityUsed;
  final int sparePartId;

  const UsageHistory({
    required this.id,
    required this.usedAt,
    required this.mechanicName,
    required this.quantityUsed,
    required this.sparePartId,
  });

  factory UsageHistory.fromJson(Map<String, dynamic> json) {
    return UsageHistory(
      id: json['uh_id'] ?? 0,
      usedAt: json['used_at'] != null
          ? DateTime.parse(json['used_at'].toString())
          : DateTime.now(), // fallback if null
      mechanicName: json['machanic_name'] ?? 'Unknown Mechanic',
      quantityUsed: (json['quantity_used'] as num?)?.toInt() ?? 0,
      sparePartId: json['sp_id'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uh_id': id,
      'used_at': usedAt.toIso8601String(),
      'machanic_name': mechanicName,
      'quantity_used': quantityUsed,
      'sp_id': sparePartId,
    };
  }
}

import '../Model/procurement.dart';
import '../Model/spare_part_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../Model/usage_history_model.dart';

class InventoryController {
  final supabase = Supabase.instance.client;

  Future<List<SparePart>> fetchSpareParts() async {
    final response = await supabase.from('spare_parts').select();
    return (response as List).map((e) => SparePart.fromJson(e)).toList();
  }

  Future<List<UsageHistory>> fetchUsageHistory(int sparePartId) async {
    final response = await supabase
        .from('Usage_history')
        .select()
        .eq('sp_id', sparePartId)
        .order('used_at', ascending: false);

    if (response == null || response.isEmpty) {
      return [];
    }

    return (response as List)
        .map((json) => UsageHistory.fromJson(json))
        .toList();
  }

  Future<List<Procurement>> fetchProcurementList() async {
    final response = await supabase.from('Procurement').select();
    return (response as List).map((e) => Procurement.fromJson(e)).toList();
  }
}

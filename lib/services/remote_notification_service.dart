import 'package:cloud_functions/cloud_functions.dart';

import 'database.dart';

class RemoteNotificationService {
  static FirebaseFunctions functions = FirebaseFunctions.instance;

  static Future<void> newActionNotification({
    required List<String> tokens,
    required String title,
    required String subtitle,
  }) async {
    final res = await supabase.functions.invoke('new-action', body: {
      'tokens': tokens,
      'title': title,
      'subtitle': subtitle,
    });
    final data = res.data;
  }
}
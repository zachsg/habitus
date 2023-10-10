import 'package:cloud_functions/cloud_functions.dart';

import '../models/xmodels.dart';
import 'database.dart';

class RemoteNotificationService {
  static FirebaseFunctions functions = FirebaseFunctions.instance;

  static Future<void> newActionNotification({
    required List<String> tokens,
    required String title,
    required String subtitle,
    required HUHabitatModel habitat,
  }) async {
    await supabase.functions.invoke('new-action', body: {
      'tokens': tokens,
      'title': title,
      'subtitle': subtitle,
      'habitat': habitat,
    });
  }

  static Future<void> newReactionNotification({
    required String token,
    required String title,
    required String subtitle,
    required HUHabitatModel habitat,
  }) async {
    await supabase.functions.invoke('new-reaction', body: {
      'token': token,
      'title': title,
      'subtitle': subtitle,
      'habitat': habitat,
    });
  }

  static Future<void> inviteNotification({
    required String token,
    required String title,
    required String subtitle,
    required HUHabitatModel habitat,
  }) async {
    await supabase.functions.invoke('invited', body: {
      'token': token,
      'title': title,
      'subtitle': subtitle,
      'habitat': habitat,
    });
  }
}

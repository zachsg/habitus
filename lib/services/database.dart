import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/xmodels.dart';

const supabaseUrl = 'https://avxqghvyhbpdggvuxaxh.supabase.co';
const supabasePublicKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF2eHFnaHZ5aGJwZGdndnV4YXhoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI4MTY2MTksImV4cCI6MjAwODM5MjYxOX0.SGRpRoecF4SN3UxYOVWtg8t2454vhuetKhuERE3BI_M';

final supabase = Supabase.instance.client;

class Database {
  static const profiles = 'profiles';

  /// Create or update user profile: Return true if no errors, false if errors.
  static Future<bool> updateProfile(HUProfileModel profile) async {
    final profileJson = profile.toJson();
    try {
      await supabase.from(profiles).upsert(profileJson);
    } on Exception catch (_) {
      return false;
    }

    return true;
  }
}

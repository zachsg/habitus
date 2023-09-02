import 'package:supabase_flutter/supabase_flutter.dart';

import '../helpers/exceptions.dart';
import '../models/xmodels.dart';

const supabaseUrl = 'https://avxqghvyhbpdggvuxaxh.supabase.co';
const supabasePublicKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF2eHFnaHZ5aGJwZGdndnV4YXhoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI4MTY2MTksImV4cCI6MjAwODM5MjYxOX0.SGRpRoecF4SN3UxYOVWtg8t2454vhuetKhuERE3BI_M';

final supabase = Supabase.instance.client;

class Database {
  static const profilesTable = 'profiles';
  static const teamsTable = 'teams';

  /// Create or update user profile: Return true if no errors, false if errors.
  static Future<bool> createProfile(HUProfileModel profile) async {
    final profileJson = profile.toJson();
    try {
      await supabase.from(profilesTable).upsert(profileJson);
    } on Exception catch (_) {
      return false;
    }

    return true;
  }

  static Future<bool> saveProfileName(HUProfileModel profile) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      return false;
    }

    try {
      await supabase.from(profilesTable).update({
        'updated_at': profile.updatedAt.toIso8601String(),
        'name': profile.name,
      }).eq('id', user.id);
    } on Exception catch (_) {
      return false;
    }

    return true;
  }

  static Future<bool> saveProfileHandle(HUProfileModel profile) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      return false;
    }

    try {
      await supabase.from(profilesTable).update({
        'updated_at': profile.updatedAt.toIso8601String(),
        'handle': profile.handle,
      }).eq('id', user.id);
    } on Exception catch (_) {
      return false;
    }

    return true;
  }

  static Future<bool> saveProfileBio(HUProfileModel profile) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      return false;
    }

    try {
      await supabase.from(profilesTable).update({
        'updated_at': profile.updatedAt.toIso8601String(),
        'bio': profile.bio,
      }).eq('id', user.id);
    } on Exception catch (_) {
      return false;
    }

    return true;
  }

  static Future<HUProfileModel> profile() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final id = user.id;
    try {
      final profileJson =
          await supabase.from(profilesTable).select().eq('id', id).single();
      return HUProfileModel.fromJson(profileJson);
    } on Exception catch (e) {
      throw UserNotFoundException(e.toString());
    }
  }

  static Future<List<HUTeamModel>> teams() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final id = user.id;
    try {
      final listOfTeamsJsons = await supabase
          .from(teamsTable)
          .select()
          .or('creator_id.eq.$id,admins.cs.{$id},members.cs.{$id}');
      final List<HUTeamModel> teams = [];
      for (final teamsJson in listOfTeamsJsons) {
        final team = HUTeamModel.fromJson(teamsJson);
        teams.add(team);
      }
      return teams;
    } on Exception catch (e) {
      throw UserNotFoundException(e.toString());
    }
  }
}

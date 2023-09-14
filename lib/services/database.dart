import 'package:supabase_flutter/supabase_flutter.dart';

import '../helpers/exceptions.dart';
import '../models/xmodels.dart';

const supabaseUrl = 'https://avxqghvyhbpdggvuxaxh.supabase.co';
const supabasePublicKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImF2eHFnaHZ5aGJwZGdndnV4YXhoIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTI4MTY2MTksImV4cCI6MjAwODM5MjYxOX0.SGRpRoecF4SN3UxYOVWtg8t2454vhuetKhuERE3BI_M';

final supabase = Supabase.instance.client;

class Database {
  static const profilesTable = 'profiles';
  static const habitatsTable = 'habitats';
  static const actionsTable = 'actions';

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

  static Future<List<HUProfileModel>> profilesWithIds(List<String> ids) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    try {
      final profilesJson =
          await supabase.from(profilesTable).select().in_('id', ids);

      List<HUProfileModel> profiles = [];
      for (final profileJson in profilesJson) {
        final profile = HUProfileModel.fromJson(profileJson);
        profiles.add(profile);
      }

      return profiles;
    } on Exception catch (e) {
      throw GenericErrorException(e.toString());
    }
  }

  static Future<List<HUActionModel>> actionsWithHabitatId(int id) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    try {
      final now = DateTime.now().copyWith(hour: 0, minute: 0);
      final actionsJson = await supabase
          .from(actionsTable)
          .select()
          .eq('habitat_id', id)
          .gt('created_at', now.toUtc());

      List<HUActionModel> actions = [];
      for (final actionJson in actionsJson) {
        final action = HUActionModel.fromJson(actionJson);
        actions.add(action);
      }

      return actions;
    } on Exception catch (e) {
      throw GenericErrorException(e.toString());
    }
  }

  static Future<List<HUHabitatModel>> habitats() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final id = user.id;
    try {
      final listOfHabitatsJsons = await supabase
          .from(habitatsTable)
          .select()
          .or('creator_id.eq.$id,admins.cs.{$id},members.cs.{$id}')
          .order('id', ascending: true);
      final List<HUHabitatModel> habitats = [];
      for (final habitatsJson in listOfHabitatsJsons) {
        final habitat = HUHabitatModel.fromJson(habitatsJson);
        habitats.add(habitat);
      }
      return habitats;
    } on Exception catch (e) {
      throw UserNotFoundException(e.toString());
    }
  }

  static Future<HUHabitatModel> habitatWithId(int id) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    try {
      final habitatJson =
          await supabase.from(habitatsTable).select().eq('id', id).single();
      final habitat = HUHabitatModel.fromJson(habitatJson);
      return habitat;
    } on Exception catch (e) {
      throw UserNotFoundException(e.toString());
    }
  }

  static Future<List<HUHabitatModel>> habitatsWithNamesContaining(
      String name) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final id = user.id;
    try {
      final profileJson =
          await supabase.from(profilesTable).select().eq('id', id).single();
      final profile = HUProfileModel.fromJson(profileJson);

      List<int> ids = [];
      for (final goal in profile.goals) {
        ids.add(goal.habitatId);
      }

      final listOfHabitatsJsons = await supabase
          .from(habitatsTable)
          .select()
          .like('name', '%$name%')
          .not('id', 'in', ids);

      final List<HUHabitatModel> habitats = [];
      for (final habitatsJson in listOfHabitatsJsons) {
        final habitat = HUHabitatModel.fromJson(habitatsJson);
        habitats.add(habitat);
      }
      return habitats;
    } on Exception catch (e) {
      throw GenericErrorException(e.toString());
    }
  }

  static Future<bool> joinHabitat(HUHabitatModel habitat) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final members = [...habitat.members, user.id];

    try {
      await supabase.from(habitatsTable).update({
        'members': members,
      }).eq('id', habitat.id);
      return true;
    } on Exception catch (e) {
      throw GenericErrorException(e.toString());
    }
  }

  static Future<bool> updateHabitat(HUHabitatModel habitat) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    try {
      await supabase
          .from(habitatsTable)
          .update(habitat.toJson())
          .eq('id', habitat.id);
      return true;
    } on Exception catch (e) {
      throw GenericErrorException(e.toString());
    }
  }

  static Future<bool> updateProfileHabitatsAndGoals(
    HUProfileModel profile,
  ) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final id = user.id;
    try {
      await supabase.from(profilesTable).update({
        'goals': profile.goals,
      }).eq('id', id);
      return true;
    } on Exception catch (e) {
      throw GenericErrorException(e.toString());
    }
  }

  static Future<bool> saveAction(HUActionModel action) async {
    final actionJson = action.toJson();

    actionJson.removeWhere((key, value) => key == 'id');

    try {
      await supabase.from(actionsTable).upsert(actionJson);
    } on Exception catch (_) {
      return false;
    }

    return true;
  }
}

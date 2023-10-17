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
  static const deletionsTable = 'deletion_requests';
  static const reactionsTable = 'reactions';
  static const possibleReactionsTable = 'possible_reactions';
  static const calloutsTable = 'callouts';

  static Future<bool> checkHandleAvailability(String handle) async {
    try {
      List<dynamic> results =
          await supabase.from(profilesTable).select().ilike('handle', handle);

      if (results.isEmpty) {
        return true;
      } else {
        return false;
      }
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<List<HUProfileModel>> searchForHabitmates(String text) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      return [];
    }

    try {
      final profilesJson = await supabase
          .from(profilesTable)
          .select()
          .or('name.ilike.%$text%,handle.ilike.%$text%');

      List<HUProfileModel> profiles = [];
      for (final profileJson in profilesJson) {
        final profile = HUProfileModel.fromJson(profileJson);
        profiles.add(profile);
      }

      return profiles;
    } on Exception catch (_) {
      return [];
    }
  }

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

  static Future<bool> acceptEula(HUProfileModel profile) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      return false;
    }

    try {
      await supabase.from(profilesTable).update({
        'updated_at': profile.updatedAt.toIso8601String(),
        'accepted_terms': profile.acceptedTerms,
      }).eq('id', user.id);
    } on Exception catch (_) {
      return false;
    }

    return true;
  }

  static Future<bool> savePushToken(HUProfileModel profile) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      return false;
    }

    try {
      await supabase.from(profilesTable).update({
        'push_token': profile.pushToken,
      }).eq('id', user.id);
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

  static Future<List<HUActionModel>> actionsWithHabitatId(
    int id,
    DateTime day,
  ) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    try {
      final start = day.copyWith(hour: 0, minute: 0);
      final end = day.copyWith(hour: 24, minute: 59);

      final actionsJson = await supabase
          .from(actionsTable)
          .select()
          .eq('habitat_id', id)
          .gt('created_at', start.toUtc())
          .lt('created_at', end.toUtc());

      List<HUActionModel> actions = [];
      for (final actionJson in actionsJson) {
        final action = HUActionModel.fromJson(actionJson);
        actions.add(action);
      }

      return actions;
    } on Exception catch (_) {
      return [];
    }
  }

  static Future<List<HUCalloutModel>> calloutsWithHabitatId({
    required int id,
    required bool isDone,
  }) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final day = DateTime.now();

    try {
      final start = day.copyWith(hour: 0, minute: 0);
      final end = day.copyWith(hour: 24, minute: 59);

      final calloutsJson = isDone
          ? await supabase
              .from(calloutsTable)
              .select()
              .eq('habitat_id', id)
              .eq('done', false)
              .gt('created_at', start.toUtc())
              .lt('created_at', end.toUtc())
          : await supabase
              .from(calloutsTable)
              .select()
              .eq('habitat_id', id)
              .gt('created_at', start.toUtc())
              .lt('created_at', end.toUtc());

      List<HUCalloutModel> callouts = [];
      for (final calloutJson in calloutsJson) {
        final callout = HUCalloutModel.fromJson(calloutJson);
        callouts.add(callout);
      }

      return callouts;
    } on Exception catch (_) {
      return [];
    }
  }

  static Future<List<HUCalloutModel>> allOfMyCalloutsToday() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final day = DateTime.now();

    try {
      final start = day.copyWith(hour: 0, minute: 0);
      final end = day.copyWith(hour: 24, minute: 59);

      final calloutsJson = await supabase
          .from(calloutsTable)
          .select()
          .eq('callee', user.id)
          .eq('done', false)
          .gt('created_at', start.toUtc())
          .lt('created_at', end.toUtc());

      List<HUCalloutModel> callouts = [];
      for (final calloutJson in calloutsJson) {
        final callout = HUCalloutModel.fromJson(calloutJson);
        callouts.add(callout);
      }

      return callouts;
    } on Exception catch (_) {
      return [];
    }
  }

  static Future<List<HUActionModel>> myActionsForToday() async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    try {
      final start = DateTime.now().copyWith(hour: 0, minute: 0);
      final end = DateTime.now().copyWith(hour: 24, minute: 59);

      final actionsJson = await supabase
          .from(actionsTable)
          .select()
          .eq('owner_id', user.id)
          .gt('created_at', start.toUtc())
          .lt('created_at', end.toUtc());

      List<HUActionModel> actions = [];
      for (final actionJson in actionsJson) {
        final action = HUActionModel.fromJson(actionJson);
        actions.add(action);
      }

      return actions;
    } on Exception catch (_) {
      return [];
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
          .order('updated_at', ascending: false);
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
    String name,
  ) async {
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
          .not('id', 'in', ids)
          .not('is_open', 'eq', 'false');

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

  static Future<int> makeHabitat(HUHabitatModel habitat) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final now = DateTime.now().toUtc();
    final h = habitat.copyWith(updatedAt: now);
    final habitatJson = h.toJson();
    habitatJson.removeWhere((key, value) => key == 'id');

    try {
      final id = await supabase
          .from(habitatsTable)
          .insert(habitatJson)
          .select('id')
          .single();
      return id['id'];
    } on Exception catch (e) {
      throw GenericErrorException(e.toString());
    }
  }

  static Future<bool> deleteHabitat(HUHabitatModel habitat) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    try {
      await supabase
          .from(habitatsTable)
          .delete()
          .eq('id', habitat.id)
          .eq('creator_id', user.id);
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

    final now = DateTime.now().toUtc();
    final h = habitat.copyWith(updatedAt: now);

    try {
      await supabase.from(habitatsTable).update(h.toJson()).eq('id', h.id);
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

    try {
      await supabase.from(profilesTable).update({
        'goals': profile.goals,
      }).eq('id', profile.id);
      return true;
    } on Exception catch (e) {
      throw GenericErrorException(e.toString());
    }
  }

  static Future<bool> saveAction(
    HUHabitatModel habitat,
    HUActionModel action,
  ) async {
    final actionJson = action.toJson();

    actionJson.removeWhere((key, value) => key == 'id');

    try {
      await supabase.from(actionsTable).upsert(actionJson);
      await updateHabitat(habitat);
    } on Exception catch (_) {
      return false;
    }

    return true;
  }

  static Future<bool> deleteAccount(String id) async {
    final date = DateTime.now().toUtc();

    try {
      await supabase.from(deletionsTable).insert({
        'created_at': date.toIso8601String(),
        'user_id': id,
      });

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<List<HUReactionModel>> possibleReactions(List<int> ids) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    try {
      final listOfPossibleReactionsJsons = await supabase
          .from(possibleReactionsTable)
          .select()
          .in_('action_id', [0, 1, 2]).order('id', ascending: true);

      final List<HUReactionModel> reactions = [];
      for (final reactionJson in listOfPossibleReactionsJsons) {
        final reaction = HUReactionModel.fromJson(reactionJson);
        reactions.add(reaction);
      }

      return reactions;
    } on Exception catch (e) {
      throw GenericErrorException(e.toString());
    }
  }

  static Future<List<HUReactionModel>> myReactionsForActivity(
      int activityId) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final id = user.id;
    try {
      final listOfReactionsJsons = await supabase
          .from(reactionsTable)
          .select()
          .eq('owner_id', id)
          .or('action_id.eq.$activityId,callout_id.eq.$activityId');

      final List<HUReactionModel> reactions = [];
      for (final reactionJson in listOfReactionsJsons) {
        final reaction = HUReactionModel.fromJson(reactionJson);
        reactions.add(reaction);
      }

      return reactions;
    } on Exception catch (e) {
      throw GenericErrorException(e.toString());
    }
  }

  static Future<bool> react(HUReactionModel reaction) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final reactionJson = reaction.toJson();

    reactionJson.removeWhere((key, value) => key == 'id');

    try {
      await supabase.from(reactionsTable).insert(reactionJson);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<List<HUReactionModel>> reactions({
    required List<int> actions,
    required List<int> callouts,
  }) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    try {
      final listOfReactionsJsons = await supabase.from(reactionsTable).select().or(
          'action_id.in.(${actions.join(',')}),callout_id.in.(${callouts.join(',')})');

      final List<HUReactionModel> reactions = [];
      for (final reactionJson in listOfReactionsJsons) {
        final reaction = HUReactionModel.fromJson(reactionJson);
        reactions.add(reaction);
      }

      return reactions;
    } on Exception catch (e) {
      throw GenericErrorException(e.toString());
    }
  }

  static Future<bool> addCallout(HUCalloutModel callout) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    final calloutJson = callout.toJson();
    calloutJson.removeWhere((key, value) => key == 'id' || key == 'created_at');

    try {
      await supabase.from(calloutsTable).insert(calloutJson);

      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  static Future<bool> markCalloutDone(List<HUCalloutModel> callouts) async {
    final user = supabase.auth.currentUser;
    if (user == null) {
      throw NoAuthException();
    }

    try {
      final List<int> ids = [];
      for (final callout in callouts) {
        if (!callout.done) {
          final c = callout.copyWith(done: true);
          ids.add(c.id);
        }
      }
      final time = DateTime.now().toUtc().toIso8601String();
      await supabase.from(calloutsTable).update({
        'created_at': time,
        'done': true,
      }).in_('id', ids);

      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}

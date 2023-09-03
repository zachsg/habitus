// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$teamHash() => r'e5107437af6b0ab012bf48759d3072bf3526f34b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$Team extends BuildlessAutoDisposeNotifier<TeamModel> {
  late final HUTeamModel team;

  TeamModel build(
    HUTeamModel team,
  );
}

/// See also [Team].
@ProviderFor(Team)
const teamProvider = TeamFamily();

/// See also [Team].
class TeamFamily extends Family<TeamModel> {
  /// See also [Team].
  const TeamFamily();

  /// See also [Team].
  TeamProvider call(
    HUTeamModel team,
  ) {
    return TeamProvider(
      team,
    );
  }

  @override
  TeamProvider getProviderOverride(
    covariant TeamProvider provider,
  ) {
    return call(
      provider.team,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'teamProvider';
}

/// See also [Team].
class TeamProvider extends AutoDisposeNotifierProviderImpl<Team, TeamModel> {
  /// See also [Team].
  TeamProvider(
    HUTeamModel team,
  ) : this._internal(
          () => Team()..team = team,
          from: teamProvider,
          name: r'teamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$teamHash,
          dependencies: TeamFamily._dependencies,
          allTransitiveDependencies: TeamFamily._allTransitiveDependencies,
          team: team,
        );

  TeamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.team,
  }) : super.internal();

  final HUTeamModel team;

  @override
  TeamModel runNotifierBuild(
    covariant Team notifier,
  ) {
    return notifier.build(
      team,
    );
  }

  @override
  Override overrideWith(Team Function() create) {
    return ProviderOverride(
      origin: this,
      override: TeamProvider._internal(
        () => create()..team = team,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        team: team,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Team, TeamModel> createElement() {
    return _TeamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TeamProvider && other.team == team;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, team.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TeamRef on AutoDisposeNotifierProviderRef<TeamModel> {
  /// The parameter `team` of this provider.
  HUTeamModel get team;
}

class _TeamProviderElement
    extends AutoDisposeNotifierProviderElement<Team, TeamModel> with TeamRef {
  _TeamProviderElement(super.provider);

  @override
  HUTeamModel get team => (origin as TeamProvider).team;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member

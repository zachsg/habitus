// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grow.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$growHash() => r'8e50efe9f7ab5ce358acc17721aaa8d7f046a2b6';

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

abstract class _$Grow extends BuildlessNotifier<GrowModel> {
  late final HUHabitatAndActionModel habitatAndAction;

  GrowModel build(
    HUHabitatAndActionModel habitatAndAction,
  );
}

/// See also [Grow].
@ProviderFor(Grow)
const growProvider = GrowFamily();

/// See also [Grow].
class GrowFamily extends Family<GrowModel> {
  /// See also [Grow].
  const GrowFamily();

  /// See also [Grow].
  GrowProvider call(
    HUHabitatAndActionModel habitatAndAction,
  ) {
    return GrowProvider(
      habitatAndAction,
    );
  }

  @override
  GrowProvider getProviderOverride(
    covariant GrowProvider provider,
  ) {
    return call(
      provider.habitatAndAction,
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
  String? get name => r'growProvider';
}

/// See also [Grow].
class GrowProvider extends NotifierProviderImpl<Grow, GrowModel> {
  /// See also [Grow].
  GrowProvider(
    HUHabitatAndActionModel habitatAndAction,
  ) : this._internal(
          () => Grow()..habitatAndAction = habitatAndAction,
          from: growProvider,
          name: r'growProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$growHash,
          dependencies: GrowFamily._dependencies,
          allTransitiveDependencies: GrowFamily._allTransitiveDependencies,
          habitatAndAction: habitatAndAction,
        );

  GrowProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.habitatAndAction,
  }) : super.internal();

  final HUHabitatAndActionModel habitatAndAction;

  @override
  GrowModel runNotifierBuild(
    covariant Grow notifier,
  ) {
    return notifier.build(
      habitatAndAction,
    );
  }

  @override
  Override overrideWith(Grow Function() create) {
    return ProviderOverride(
      origin: this,
      override: GrowProvider._internal(
        () => create()..habitatAndAction = habitatAndAction,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        habitatAndAction: habitatAndAction,
      ),
    );
  }

  @override
  NotifierProviderElement<Grow, GrowModel> createElement() {
    return _GrowProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GrowProvider && other.habitatAndAction == habitatAndAction;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitatAndAction.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GrowRef on NotifierProviderRef<GrowModel> {
  /// The parameter `habitatAndAction` of this provider.
  HUHabitatAndActionModel get habitatAndAction;
}

class _GrowProviderElement extends NotifierProviderElement<Grow, GrowModel>
    with GrowRef {
  _GrowProviderElement(super.provider);

  @override
  HUHabitatAndActionModel get habitatAndAction =>
      (origin as GrowProvider).habitatAndAction;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

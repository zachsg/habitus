// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grow.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$growHash() => r'2a71dfd2bef63ba3c035d347b37dd8cf4b09e09d';

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

abstract class _$Grow extends BuildlessAutoDisposeNotifier<GrowModel> {
  late final HUHabitatModel habitat;

  GrowModel build(
    HUHabitatModel habitat,
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
    HUHabitatModel habitat,
  ) {
    return GrowProvider(
      habitat,
    );
  }

  @override
  GrowProvider getProviderOverride(
    covariant GrowProvider provider,
  ) {
    return call(
      provider.habitat,
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
class GrowProvider extends AutoDisposeNotifierProviderImpl<Grow, GrowModel> {
  /// See also [Grow].
  GrowProvider(
    HUHabitatModel habitat,
  ) : this._internal(
          () => Grow()..habitat = habitat,
          from: growProvider,
          name: r'growProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product') ? null : _$growHash,
          dependencies: GrowFamily._dependencies,
          allTransitiveDependencies: GrowFamily._allTransitiveDependencies,
          habitat: habitat,
        );

  GrowProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.habitat,
  }) : super.internal();

  final HUHabitatModel habitat;

  @override
  GrowModel runNotifierBuild(
    covariant Grow notifier,
  ) {
    return notifier.build(
      habitat,
    );
  }

  @override
  Override overrideWith(Grow Function() create) {
    return ProviderOverride(
      origin: this,
      override: GrowProvider._internal(
        () => create()..habitat = habitat,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        habitat: habitat,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Grow, GrowModel> createElement() {
    return _GrowProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GrowProvider && other.habitat == habitat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GrowRef on AutoDisposeNotifierProviderRef<GrowModel> {
  /// The parameter `habitat` of this provider.
  HUHabitatModel get habitat;
}

class _GrowProviderElement
    extends AutoDisposeNotifierProviderElement<Grow, GrowModel> with GrowRef {
  _GrowProviderElement(super.provider);

  @override
  HUHabitatModel get habitat => (origin as GrowProvider).habitat;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

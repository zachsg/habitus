// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habitat.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$habitatHash() => r'a48cf5aa818e80df8ff83df0d77811c8ecaab12b';

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

abstract class _$Habitat extends BuildlessAutoDisposeNotifier<HabitatModel> {
  late final HUHabitatModel habitat;

  HabitatModel build(
    HUHabitatModel habitat,
  );
}

/// See also [Habitat].
@ProviderFor(Habitat)
const habitatProvider = HabitatFamily();

/// See also [Habitat].
class HabitatFamily extends Family<HabitatModel> {
  /// See also [Habitat].
  const HabitatFamily();

  /// See also [Habitat].
  HabitatProvider call(
    HUHabitatModel habitat,
  ) {
    return HabitatProvider(
      habitat,
    );
  }

  @override
  HabitatProvider getProviderOverride(
    covariant HabitatProvider provider,
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
  String? get name => r'habitatProvider';
}

/// See also [Habitat].
class HabitatProvider
    extends AutoDisposeNotifierProviderImpl<Habitat, HabitatModel> {
  /// See also [Habitat].
  HabitatProvider(
    HUHabitatModel habitat,
  ) : this._internal(
          () => Habitat()..habitat = habitat,
          from: habitatProvider,
          name: r'habitatProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$habitatHash,
          dependencies: HabitatFamily._dependencies,
          allTransitiveDependencies: HabitatFamily._allTransitiveDependencies,
          habitat: habitat,
        );

  HabitatProvider._internal(
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
  HabitatModel runNotifierBuild(
    covariant Habitat notifier,
  ) {
    return notifier.build(
      habitat,
    );
  }

  @override
  Override overrideWith(Habitat Function() create) {
    return ProviderOverride(
      origin: this,
      override: HabitatProvider._internal(
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
  AutoDisposeNotifierProviderElement<Habitat, HabitatModel> createElement() {
    return _HabitatProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HabitatProvider && other.habitat == habitat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HabitatRef on AutoDisposeNotifierProviderRef<HabitatModel> {
  /// The parameter `habitat` of this provider.
  HUHabitatModel get habitat;
}

class _HabitatProviderElement
    extends AutoDisposeNotifierProviderElement<Habitat, HabitatModel>
    with HabitatRef {
  _HabitatProviderElement(super.provider);

  @override
  HUHabitatModel get habitat => (origin as HabitatProvider).habitat;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

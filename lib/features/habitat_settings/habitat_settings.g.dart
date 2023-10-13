// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habitat_settings.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$habitatSettingsHash() => r'1d115484151a7b0b30aef79924666ea50dec39de';

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

abstract class _$HabitatSettings
    extends BuildlessAutoDisposeNotifier<HabitatSettingsModel> {
  late final HUHabitatModel habitat;

  HabitatSettingsModel build(
    HUHabitatModel habitat,
  );
}

/// See also [HabitatSettings].
@ProviderFor(HabitatSettings)
const habitatSettingsProvider = HabitatSettingsFamily();

/// See also [HabitatSettings].
class HabitatSettingsFamily extends Family<HabitatSettingsModel> {
  /// See also [HabitatSettings].
  const HabitatSettingsFamily();

  /// See also [HabitatSettings].
  HabitatSettingsProvider call(
    HUHabitatModel habitat,
  ) {
    return HabitatSettingsProvider(
      habitat,
    );
  }

  @visibleForOverriding
  @override
  HabitatSettingsProvider getProviderOverride(
    covariant HabitatSettingsProvider provider,
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
  String? get name => r'habitatSettingsProvider';
}

/// See also [HabitatSettings].
class HabitatSettingsProvider extends AutoDisposeNotifierProviderImpl<
    HabitatSettings, HabitatSettingsModel> {
  /// See also [HabitatSettings].
  HabitatSettingsProvider(
    HUHabitatModel habitat,
  ) : this._internal(
          () => HabitatSettings()..habitat = habitat,
          from: habitatSettingsProvider,
          name: r'habitatSettingsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$habitatSettingsHash,
          dependencies: HabitatSettingsFamily._dependencies,
          allTransitiveDependencies:
              HabitatSettingsFamily._allTransitiveDependencies,
          habitat: habitat,
        );

  HabitatSettingsProvider._internal(
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
  HabitatSettingsModel runNotifierBuild(
    covariant HabitatSettings notifier,
  ) {
    return notifier.build(
      habitat,
    );
  }

  @override
  Override overrideWith(HabitatSettings Function() create) {
    return ProviderOverride(
      origin: this,
      override: HabitatSettingsProvider._internal(
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
  AutoDisposeNotifierProviderElement<HabitatSettings, HabitatSettingsModel>
      createElement() {
    return _HabitatSettingsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is HabitatSettingsProvider && other.habitat == habitat;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitat.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin HabitatSettingsRef
    on AutoDisposeNotifierProviderRef<HabitatSettingsModel> {
  /// The parameter `habitat` of this provider.
  HUHabitatModel get habitat;
}

class _HabitatSettingsProviderElement
    extends AutoDisposeNotifierProviderElement<HabitatSettings,
        HabitatSettingsModel> with HabitatSettingsRef {
  _HabitatSettingsProviderElement(super.provider);

  @override
  HUHabitatModel get habitat => (origin as HabitatSettingsProvider).habitat;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, inference_failure_on_uninitialized_variable, inference_failure_on_function_return_type, inference_failure_on_untyped_parameter

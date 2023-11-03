// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calendarHash() => r'a1529314a9371741bc2ffeb216225b875807a910';

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

abstract class _$Calendar extends BuildlessAutoDisposeNotifier<CalendarModel> {
  late final List<HUHabitatModel> habitats;

  CalendarModel build(
    List<HUHabitatModel> habitats,
  );
}

/// See also [Calendar].
@ProviderFor(Calendar)
const calendarProvider = CalendarFamily();

/// See also [Calendar].
class CalendarFamily extends Family<CalendarModel> {
  /// See also [Calendar].
  const CalendarFamily();

  /// See also [Calendar].
  CalendarProvider call(
    List<HUHabitatModel> habitats,
  ) {
    return CalendarProvider(
      habitats,
    );
  }

  @override
  CalendarProvider getProviderOverride(
    covariant CalendarProvider provider,
  ) {
    return call(
      provider.habitats,
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
  String? get name => r'calendarProvider';
}

/// See also [Calendar].
class CalendarProvider
    extends AutoDisposeNotifierProviderImpl<Calendar, CalendarModel> {
  /// See also [Calendar].
  CalendarProvider(
    List<HUHabitatModel> habitats,
  ) : this._internal(
          () => Calendar()..habitats = habitats,
          from: calendarProvider,
          name: r'calendarProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$calendarHash,
          dependencies: CalendarFamily._dependencies,
          allTransitiveDependencies: CalendarFamily._allTransitiveDependencies,
          habitats: habitats,
        );

  CalendarProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.habitats,
  }) : super.internal();

  final List<HUHabitatModel> habitats;

  @override
  CalendarModel runNotifierBuild(
    covariant Calendar notifier,
  ) {
    return notifier.build(
      habitats,
    );
  }

  @override
  Override overrideWith(Calendar Function() create) {
    return ProviderOverride(
      origin: this,
      override: CalendarProvider._internal(
        () => create()..habitats = habitats,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        habitats: habitats,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<Calendar, CalendarModel> createElement() {
    return _CalendarProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CalendarProvider && other.habitats == habitats;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, habitats.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CalendarRef on AutoDisposeNotifierProviderRef<CalendarModel> {
  /// The parameter `habitats` of this provider.
  List<HUHabitatModel> get habitats;
}

class _CalendarProviderElement
    extends AutoDisposeNotifierProviderElement<Calendar, CalendarModel>
    with CalendarRef {
  _CalendarProviderElement(super.provider);

  @override
  List<HUHabitatModel> get habitats => (origin as CalendarProvider).habitats;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

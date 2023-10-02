import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/xmodels.dart';
import '../profile/profile.dart';
import 'habitat_settings_model.dart';

part 'habitat_settings.g.dart';

@riverpod
class HabitatSettings extends _$HabitatSettings {
  @override
  HabitatSettingsModel build(HUHabitatModel habitat) => HabitatSettingsModel(
        profile: ref.read(profileProvider).profile,
        habitat: habitat,
      );
}

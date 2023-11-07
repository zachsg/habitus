// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'h_u_goal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HUGoalModelImpl _$$HUGoalModelImplFromJson(Map<String, dynamic> json) =>
    _$HUGoalModelImpl(
      habitatId: json['habitat_id'] as int,
      habit: json['habit'] as String,
      unit: $enumDecode(_$UnitEnumMap, json['unit']),
      value: json['value'] as int,
      dateOfLastCredit: json['date_of_last_credit'] == null
          ? null
          : DateTime.parse(json['date_of_last_credit'] as String),
      credits: json['credits'] as int? ?? 0,
      daysOff: (json['days_off'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$DayEnumMap, e))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$HUGoalModelImplToJson(_$HUGoalModelImpl instance) =>
    <String, dynamic>{
      'habitat_id': instance.habitatId,
      'habit': instance.habit,
      'unit': _$UnitEnumMap[instance.unit]!,
      'value': instance.value,
      'date_of_last_credit': instance.dateOfLastCredit?.toIso8601String(),
      'credits': instance.credits,
      'days_off': instance.daysOff.map((e) => _$DayEnumMap[e]!).toList(),
    };

const _$UnitEnumMap = {
  Unit.miles: 'miles',
  Unit.steps: 'steps',
  Unit.minutes: 'minutes',
};

const _$DayEnumMap = {
  Day.sunday: 'sunday',
  Day.monday: 'monday',
  Day.tuesday: 'tuesday',
  Day.wednesday: 'wednesday',
  Day.thursday: 'thursday',
  Day.friday: 'friday',
  Day.saturday: 'saturday',
};

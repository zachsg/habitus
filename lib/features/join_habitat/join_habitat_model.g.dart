// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_habitat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JoinHabitatModelImpl _$$JoinHabitatModelImplFromJson(
        Map<String, dynamic> json) =>
    _$JoinHabitatModelImpl(
      habitats: (json['habitats'] as List<dynamic>)
          .map((e) => HUHabitatModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      animal:
          $enumDecodeNullable(_$AnimalEnumMap, json['animal']) ?? Animal.quails,
      type: $enumDecodeNullable(_$HabitTypeEnumMap, json['type']) ??
          HabitType.read,
      unit: $enumDecodeNullable(_$UnitEnumMap, json['unit']) ?? Unit.minutes,
      goal: json['goal'] as int? ?? 10,
      cap: json['cap'] as int? ?? 4,
      isOpen: json['is_open'] as bool? ?? true,
      isJoining: json['is_joining'] as bool? ?? true,
      loading: json['loading'] as bool? ?? false,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$$JoinHabitatModelImplToJson(
        _$JoinHabitatModelImpl instance) =>
    <String, dynamic>{
      'habitats': instance.habitats,
      'animal': _$AnimalEnumMap[instance.animal]!,
      'type': _$HabitTypeEnumMap[instance.type]!,
      'unit': _$UnitEnumMap[instance.unit]!,
      'goal': instance.goal,
      'cap': instance.cap,
      'is_open': instance.isOpen,
      'is_joining': instance.isJoining,
      'loading': instance.loading,
      'error': instance.error,
    };

const _$AnimalEnumMap = {
  Animal.badgers: 'badgers',
  Animal.bears: 'bears',
  Animal.beavers: 'beavers',
  Animal.cats: 'cats',
  Animal.chipmunks: 'chipmunks',
  Animal.cows: 'cows',
  Animal.crows: 'crows',
  Animal.dogs: 'dogs',
  Animal.dolphins: 'dolphins',
  Animal.doves: 'doves',
  Animal.ducks: 'ducks',
  Animal.eagles: 'eagles',
  Animal.elephants: 'elephants',
  Animal.falcons: 'falcons',
  Animal.geckos: 'geckos',
  Animal.gerbils: 'gerbils',
  Animal.giraffes: 'giraffes',
  Animal.hawks: 'hawks',
  Animal.hippos: 'hippos',
  Animal.horses: 'horses',
  Animal.hummingbirds: 'hummingbirds',
  Animal.jaguars: 'jaguars',
  Animal.koalas: 'koalas',
  Animal.lambs: 'lambs',
  Animal.leopards: 'leopards',
  Animal.lions: 'lions',
  Animal.magpies: 'magpies',
  Animal.mice: 'mice',
  Animal.mustangs: 'mustangs',
  Animal.owls: 'owls',
  Animal.pandas: 'pandas',
  Animal.pumas: 'pumas',
  Animal.quails: 'quails',
  Animal.ravens: 'ravens',
  Animal.sheep: 'sheep',
  Animal.snakes: 'snakes',
  Animal.sparrows: 'sparrows',
  Animal.squirrels: 'squirrels',
  Animal.swans: 'swans',
  Animal.tigers: 'tigers',
  Animal.turtles: 'turtles',
  Animal.whales: 'whales',
};

const _$HabitTypeEnumMap = {
  HabitType.cook: 'cook',
  HabitType.exercise: 'exercise',
  HabitType.meditate: 'meditate',
  HabitType.read: 'read',
  HabitType.work: 'work',
};

const _$UnitEnumMap = {
  Unit.miles: 'miles',
  Unit.steps: 'steps',
  Unit.minutes: 'minutes',
};

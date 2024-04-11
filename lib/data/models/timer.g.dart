// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerModelImpl _$$TimerModelImplFromJson(Map json) => _$TimerModelImpl(
      id: json['id'] as String,
      project: json['project'] as String,
      task: json['task'] as String,
      description: json['description'] as String,
      counter: json['counter'] as int,
      isPlaying: json['isPlaying'] as bool,
      isStopped: json['isStopped'] as bool,
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$$TimerModelImplToJson(_$TimerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'project': instance.project,
      'task': instance.task,
      'description': instance.description,
      'counter': instance.counter,
      'isPlaying': instance.isPlaying,
      'isStopped': instance.isStopped,
      'isFavorite': instance.isFavorite,
    };

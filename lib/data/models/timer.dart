import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer.freezed.dart';

part 'timer.g.dart';

@freezed
class TimerModel with _$TimerModel {
  const factory TimerModel({
    required String id,
    required String project,
    required String task,
    required String description,
    required int counter,
    required bool isPlaying,
    required bool isStopped,
    required bool isFavorite,
  }) = _TimerModel;

  factory TimerModel.fromJson(Map<String, dynamic> json) =>
      _$TimerModelFromJson(json);
}

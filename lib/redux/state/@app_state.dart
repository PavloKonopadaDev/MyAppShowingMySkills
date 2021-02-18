import 'package:MyAppToShowMySkills/redux/state/message_state.dart';
import 'package:MyAppToShowMySkills/redux/state/profile_state.dart';
import 'package:json_annotation/json_annotation.dart';

part '@app_state.g.dart';

@JsonSerializable(anyMap: true)
class AppState {
  final int loaderCount;
  final MessageState message;
  final ProfileState profileState;

  AppState({
    this.loaderCount,
    this.message,
    this.profileState,
  });

  AppState.initialState()
      : loaderCount = 0,
        message = MessageState.initial(),
        profileState = ProfileState.initial();

  factory AppState.fromJson(Map json) => _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}

import 'package:MyAppToShowMySkills/models/profile_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_state.g.dart';

@JsonSerializable()
class ProfileState {
  final ProfileModels profiledata;

  ProfileState({
    this.profiledata,
  });

  factory ProfileState.initial() {
    return new ProfileState(profiledata: ProfileModels());
  }

  ProfileState copyWith({
    ProfileModels profiledata,
  }) {
    return new ProfileState(
      profiledata: profiledata ?? this.profiledata,
    );
  }

  factory ProfileState.fromJson(Map<String, dynamic> json) =>
      _$ProfileStateFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileStateToJson(this);
}

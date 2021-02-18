// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileState _$ProfileStateFromJson(Map<String, dynamic> json) {
  return ProfileState(
    profiledata: json['profiledata'] == null
        ? null
        : ProfileModels.fromJson(json['profiledata'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ProfileStateToJson(ProfileState instance) =>
    <String, dynamic>{
      'profiledata': instance.profiledata,
    };

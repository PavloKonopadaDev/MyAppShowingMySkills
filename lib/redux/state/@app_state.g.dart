// GENERATED CODE - DO NOT MODIFY BY HAND

part of '@app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map json) {
  return AppState(
    loaderCount: json['loaderCount'] as int,
    message: json['message'] == null
        ? null
        : MessageState.fromJson((json['message'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
    profileState: json['profileState'] == null
        ? null
        : ProfileState.fromJson((json['profileState'] as Map)?.map(
            (k, e) => MapEntry(k as String, e),
          )),
  );
}

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'loaderCount': instance.loaderCount,
      'message': instance.message,
      'profileState': instance.profileState,
    };

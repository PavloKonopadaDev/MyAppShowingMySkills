// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageState _$MessageStateFromJson(Map<String, dynamic> json) {
  return MessageState(
    message: json['message'] as String,
    type: _$enumDecodeNullable(_$MessageTypesEnumMap, json['type']),
  );
}

Map<String, dynamic> _$MessageStateToJson(MessageState instance) =>
    <String, dynamic>{
      'message': instance.message,
      'type': _$MessageTypesEnumMap[instance.type],
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$MessageTypesEnumMap = {
  MessageTypes.success: 'success',
  MessageTypes.error: 'error',
};

import 'package:json_annotation/json_annotation.dart';

part 'message_state.g.dart';

@JsonSerializable()
class MessageState {
  final String message;
  final MessageTypes type;

  MessageState({
    this.message,
    this.type,
  });

  factory MessageState.initial() {
    return new MessageState(
      message: null,
      type: null,
    );
  }

  MessageState copyWith({int statusCode, String message, MessageTypes type}) {
    return new MessageState(
      message: message ?? this.message,
      type: type ?? this.type,
    );
  }

  factory MessageState.fromJson(Map<String, dynamic> json) =>
      _$MessageStateFromJson(json);

  Map<String, dynamic> toJson() => _$MessageStateToJson(this);
}

enum MessageTypes { success, error }

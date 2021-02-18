import 'package:MyAppToShowMySkills/redux/state/message_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:redux/redux.dart';

class IncrementLoader {}

class DecrementLoader {}

class ToggleMessage {
  final String message;
  final MessageTypes type;

  ToggleMessage({@required this.message, this.type = MessageTypes.error});
}

void showError(Store store, DioError error) {
  String description = 'Unknown Error. Please try again';
  print(error);
  if (error != null) {
    switch (error.type) {
      case DioErrorType.CANCEL:
        description = "Request to API server was cancelled";
        break;
      case DioErrorType.CONNECT_TIMEOUT:
        description = "Connection timeout with API server";
        break;
      case DioErrorType.DEFAULT:
        description =
            "No Internet connection. Please check your network settings.";
        break;
      case DioErrorType.RECEIVE_TIMEOUT:
        description = "Missed call. Receive timeout!";
        break;
      case DioErrorType.RESPONSE:
        if (error.response.data['message'] != null) {
          if (error.response.data['message'] is String) {
            description = error.response.data['message'];
          } else {
            description = 'Unknown error';
          }
        } else if (error.response.statusCode == 401) {
          description = 'Unauthorize';
        } else if (error.response.statusCode == 400) {
          description = 'Bad request';
        }
        break;
      case DioErrorType.SEND_TIMEOUT:
        description = "It occurs when url is sent timeout.";
        break;
    }
  }
  store.dispatch(new ToggleMessage(
    message: description,
  ));
}

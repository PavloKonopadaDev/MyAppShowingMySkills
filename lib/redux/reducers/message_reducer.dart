import 'package:MyAppToShowMySkills/redux/actions/@global_actions.dart';
import 'package:MyAppToShowMySkills/redux/state/message_state.dart';

MessageState messageReducer(MessageState state, action) {
  if (action is ToggleMessage) {
    return state.copyWith(
      message: action.message,
      type: action.type,
    );
  }

  return state;
}

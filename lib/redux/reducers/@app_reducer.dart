import 'package:MyAppToShowMySkills/redux/reducers/loader_reducer.dart';
import 'package:MyAppToShowMySkills/redux/reducers/message_reducer.dart';
import 'package:MyAppToShowMySkills/redux/reducers/profile_reducer.dart';
import 'package:MyAppToShowMySkills/redux/state/@app_state.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    loaderCount: loaderReducer(state.loaderCount, action),
    message: messageReducer(state.message, action),
    profileState: profileReducer(state.profileState, action),
  );
}

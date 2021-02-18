import 'package:MyAppToShowMySkills/redux/actions/@global_actions.dart';

int loaderReducer(int state, action) {
  if (action is IncrementLoader) {
    return ++state;
  }

  if (action is DecrementLoader) {
    return --state;
  }

  return state;
}

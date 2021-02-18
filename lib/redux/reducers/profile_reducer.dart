import 'package:MyAppToShowMySkills/redux/actions/profile_actions.dart';
import 'package:MyAppToShowMySkills/redux/state/profile_state.dart';

import 'package:redux/redux.dart';

final Reducer<ProfileState> profileReducer = combineReducers<ProfileState>([
  TypedReducer<ProfileState, SetProfileSignIn>(
    setProfileSignIn,
  ),
  TypedReducer<ProfileState, SetProfileSignUp>(
    setProfileSignUp,
  ),
  TypedReducer<ProfileState, SetProfileSignUpChangeEmail>(
    setProfileSignUpChangeEmail,
  ),
  TypedReducer<ProfileState, SetProfileSignUpForgotPassword>(
    setProfileSignUpForgotPassword,
  ),
  TypedReducer<ProfileState, SetProfileInputData>(
    setProfileInputData,
  ),
]);

ProfileState setProfileSignIn(ProfileState state, SetProfileSignIn action) {
  return state.copyWith(
    profiledata: state.profiledata.copyWith(
      email: action.email,
      password: action.password,
    ),
  );
}

ProfileState setProfileSignUp(ProfileState state, SetProfileSignUp action) {
  return state.copyWith(
    profiledata: state.profiledata.copyWith(
      name: action.name,
      email: action.email,
      password: action.password,
      confirmPassword: action.confirmPassword,
    ),
  );
}

ProfileState setProfileSignUpChangeEmail(
    ProfileState state, SetProfileSignUpChangeEmail action) {
  return state.copyWith(
    profiledata: state.profiledata.copyWith(
      email: action.email,
    ),
  );
}

ProfileState setProfileSignUpForgotPassword(
    ProfileState state, SetProfileSignUpForgotPassword action) {
  return state.copyWith(
    profiledata: state.profiledata.copyWith(
      password: action.password,
    ),
  );
}

ProfileState setProfileInputData(
    ProfileState state, SetProfileInputData action) {
  return state.copyWith(
    profiledata: state.profiledata.copyWith(
      secondName: action.secondName,
      country: action.country,
      age: action.age,
      phoneNumber: action.phoneNumber,
    ),
  );
}

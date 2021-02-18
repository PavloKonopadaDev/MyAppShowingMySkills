import 'package:MyAppToShowMySkills/pages/sign_pages/sign_in/sign_in_form.dart';
import 'package:MyAppToShowMySkills/redux/actions/profile_actions.dart';
import 'package:MyAppToShowMySkills/redux/state/@app_state.dart';
import 'package:MyAppToShowMySkills/shared_widget/loader.dart';
import 'package:MyAppToShowMySkills/shared_widget/message_notiffications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';

class SignInContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1336);
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        return Loader(
          child: MessageNotifier(
            child: SignInForm(
              signIn: vm.signIn,
              email: vm.email,
              password: vm.password,
            ),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final Function(
    String email,
    String password,
  ) signIn;
  final String email;
  final String password;
  _ViewModel({
    @required this.signIn,
    this.email,
    this.password,
  });

  factory _ViewModel.create(Store<AppState> store) {
    _signIn(
      String email,
      String password,
    ) {
      store.dispatch(
        SetProfileSignIn(
          email: email,
          password: password,
        ),
      );
    }

    return _ViewModel(
      signIn: _signIn,
      email: store.state.profileState.profiledata.email,
      password: store.state.profileState.profiledata.password,
    );
  }
}

import 'package:MyAppToShowMySkills/pages/sign_pages/forgot_password/forgot_password_form.dart';
import 'package:MyAppToShowMySkills/redux/actions/profile_actions.dart';
import 'package:MyAppToShowMySkills/redux/state/@app_state.dart';
import 'package:MyAppToShowMySkills/shared_widget/loader.dart';
import 'package:MyAppToShowMySkills/shared_widget/message_notiffications.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ForgotPasswordContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        return Loader(
          child: MessageNotifier(
            child: ForgotPasswordForm(
              forgotPaswwordInput: vm.forgotPaswwordInput,
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
    String password,
    String confirmPaswword,
  ) forgotPaswwordInput;
  final String password;

  _ViewModel({
    @required this.forgotPaswwordInput,
    this.password,
  });
  factory _ViewModel.create(Store<AppState> store) {
    _forgotPaswwordInput(
      String password,
      String confirmPassword,
    ) {
      store.dispatch(
        SetProfileSignUpForgotPassword(
          password: password,
        ),
      );
    }

    return _ViewModel(
      forgotPaswwordInput: _forgotPaswwordInput,
      password: store.state.profileState.profiledata.password,
    );
  }
}

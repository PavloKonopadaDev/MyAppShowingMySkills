import 'package:MyAppToShowMySkills/pages/sign_pages/sign_up/sign_up_form.dart';
import 'package:MyAppToShowMySkills/redux/actions/profile_actions.dart';
import 'package:MyAppToShowMySkills/redux/state/@app_state.dart';
import 'package:MyAppToShowMySkills/shared_widget/loader.dart';
import 'package:MyAppToShowMySkills/shared_widget/message_notiffications.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SignUpContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (Store<AppState> store) => _ViewModel.create(store),
      builder: (BuildContext context, _ViewModel vm) {
        return Loader(
          child: MessageNotifier(
            child: SignUpForm(
              signUp: vm.signUp,
            ),
          ),
        );
      },
    );
  }
}

class _ViewModel {
  final Function(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) signUp;

  _ViewModel({
    @required this.signUp,
  });

  factory _ViewModel.create(Store<AppState> store) {
    _signUp(
      String name,
      String email,
      String password,
      String confirmPassword,
    ) {
      store.dispatch(
        SetProfileSignUp(
          name: name,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
        ),
      );
    }

    return _ViewModel(
      signUp: _signUp,
    );
  }
}

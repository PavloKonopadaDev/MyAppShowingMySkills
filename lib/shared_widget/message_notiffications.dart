import 'package:MyAppToShowMySkills/redux/state/@app_state.dart';
import 'package:MyAppToShowMySkills/redux/state/message_state.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class MessageNotifier extends StatelessWidget {
  MessageNotifier({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (context, vm) => child,
      onWillChange: (vm, vm2) {
        if (vm2.message != null) {
          Flushbar(
            message: vm2.message.message,
            icon: Icon(
              vm2.message.type == MessageTypes.success
                  ? Icons.check_circle_outline
                  : Icons.error_outline,
              size: 28.0,
              color: vm2.message.type == MessageTypes.success
                  ? Colors.green[300]
                  : Colors.red[300],
            ),
            duration: Duration(seconds: 3),
            leftBarIndicatorColor: vm2.message.type == MessageTypes.success
                ? Colors.green[300]
                : Colors.red[300],
          )..show(context);
        }
      },
      distinct: true,
    );
  }
}

class _ViewModel {
  final MessageState message;

  _ViewModel({
    this.message,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      message: store.state.message,
    );
  }

  @override
  int get hashCode => message.hashCode;

  @override
  bool operator ==(other) =>
      identical(this, other) ||
      other is _ViewModel && other.message == this.message;
}

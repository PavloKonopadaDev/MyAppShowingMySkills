import 'package:MyAppToShowMySkills/redux/state/@app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class Loader extends StatelessWidget {
  Loader({
    @required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.fromStore(store),
      builder: (context, vm) => Container(
        child: Stack(
          children: <Widget>[
            child,
            vm.loaderCount > 0
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                    ),
                    child: Center(
                      child: SizedBox(
                        child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                        width: 60,
                        height: 60,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class _ViewModel {
  _ViewModel({
    this.loaderCount,
  });

  final int loaderCount;

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      loaderCount: store.state.loaderCount,
    );
  }
}

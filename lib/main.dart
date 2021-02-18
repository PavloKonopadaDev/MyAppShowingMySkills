import 'package:MyAppToShowMySkills/redux/reducers/@app_reducer.dart';
import 'package:MyAppToShowMySkills/redux/state/@app_state.dart';
import 'package:MyAppToShowMySkills/routes/navigation.dart';
import 'package:MyAppToShowMySkills/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:redux_remote_devtools/redux_remote_devtools.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';

Injector injector; //індивілиність бекенд(коли)
DevToolsStore<AppState> store; //тримати зберігати дані
//Alice alice = Alice(showNotification: true, navigatorKey: Keys.navKey);//допомагаж дивитись на коли

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //нема блимання  екрана коли пргоружаю апку
  SystemChrome.setPreferredOrientations([
    //тільки вертекальна апка
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // injector = Injector.getInjector();
  // DependencyInjection().initialise(injector);
  // injector.get<HttpInterceptor>(); //заг клас який відповідаж за всі класи

  store = _storeConfiguration(); //налaштовування стору
  runApp(MaterialApp(home: MyApp(store)));
}

class MyApp extends StatefulWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "TitilliumWeb",
        ),
        title: 'MY App',
        navigatorKey: Keys.navKey,
        // theme: AppTheme.getAppTheme(context).themeData,
        routes: routes,
      ),
    );
  }
}

_storeConfiguration() {
  const REMOTE_HOST = '192.168.43.233:8000';

  var remoteDevTools = RemoteDevToolsMiddleware(REMOTE_HOST);

  final DevToolsStore<AppState> store = DevToolsStore<AppState>(
    appReducer,
    initialState: AppState.initialState(),
    middleware: [
      thunkMiddleware,
      TypedMiddleware((Store<AppState> store, action, NextDispatcher next) {
        debugPrint('Logging action: ${action.runtimeType}');
        next(action);
      }),
      remoteDevTools,
    ],
  );

  remoteDevTools.store = store;
  remoteDevTools.connect();

  return store;
}

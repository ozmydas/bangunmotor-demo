import 'package:flutter/material.dart';
import 'package:bangunmotor/screens/welcome_screen.dart';
import 'package:bangunmotor/screens/comingsoon_screen.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'package:bangunmotor/redux/app_state.dart';
import 'package:bangunmotor/redux/reducers.dart';

void main() {
  final _initialState = AppState(cartQty: 0);
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initialState);

  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: store,
        child: MaterialApp(
          title: 'BangunMotor',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.lightBlue,
          ),
          home: WelcomeScreen(),
          routes: <String, WidgetBuilder>{
            "ComingSoonScreen": (BuildContext context) =>
                new ComingSoonScreen(),
          },
        ));
  }
}

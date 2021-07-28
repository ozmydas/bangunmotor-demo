import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';

import 'intro_screen.dart';
import 'login_screen.dart';
import 'home_screen.dart';
/****/

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => new _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool _loading = false;

  /****/

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1), () {
      navigateFromSplash();
    });

    // call api buat cek versi
    // testApp();
  } // end init

  /****
	 * hanya sebatas tes url api
	 */
  void testApp() async {
    try {
      Response response = await Dio().get(ApiUrl.TEST_APP);
      print(response);

      navigateFromSplash();

      // if(response.status == "SUCCESS"){
      // 	navigateFromSplash();
      // } else {
      // 	_neverSatisfied();
      // }

    } catch (e) {
      print(e);
      _neverSatisfied();
    }
  } // end func

  /****
	 * pengecekan apa user sudah login melalui data yg tersimpan di localStorage
	 * jika belum maka tampilkan halaman login
	 * sedangkan jika sudah maka langsung arahkan ke etalase
	 */
  Future navigateFromSplash() async {
    String isOnBoard =
        await LocalStorage.sharedInstance.readValue(Constants.isOnBoard);
    String isLoggedIn =
        await LocalStorage.sharedInstance.readValue(Constants.isLoggedIn);
    // print("isOnBoard  $isOnBoard");

    if (isOnBoard == null || isOnBoard == "0") {
      // jika pertama buka
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => IntroScreen()));
    } else {
      if (isLoggedIn == null || isLoggedIn == "0") {
        // jika belum login
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        // jika sudah login
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }

  /****/

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ooops!!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Can\'t Connect to Server.'),
                Text('Check Your Internet and Try Again.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('EXIT'),
              onPressed: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        );
      },
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: FlutterLogo(size: 100.0),
    ));
  } // end build

}

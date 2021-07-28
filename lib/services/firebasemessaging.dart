import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


import 'package:bangunmotor/screens/home_screen.dart';
import 'package:bangunmotor/screens/comingsoon_screen.dart';

/****/

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

/****/

String getFCMToken(){
	_firebaseMessaging.getToken().then((token){
		return token;
	});
}

void setupFCMListeners(BuildContext context) {
	print("Registered FCM Listeners");
	_firebaseMessaging.configure(
		onMessage: (Map<String, dynamic> message) async {
			// _onMessageStreamController.add(message);
			print('on message $message');
			showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        content: ListTile(
                        title: Text(message['notification']['title']),
                        subtitle: Text(message['notification']['body']),
                    ),
                    actions: <Widget>[
                        FlatButton(
                            child: Text('Ok'),
                            onPressed: () => Navigator.of(context).pop(),
                        ),
                    ],
                ),
            );
		},
		onLaunch: (Map<String, dynamic> message) async {
			// _streamController.add(message);
			print('on launch $message');
			handlePath(message, context);
		},
		onResume: (Map<String, dynamic> message) async {
			// _streamController.add(message);
			print('on resume $message');
			handlePath(message, context);
		},
	);
}

Widget handlePath(Map<String, dynamic> dataMap, BuildContext context) {
	var route = dataMap["data"]["route"];
	var id = dataMap["data"]["id"];

	print("ASU ${route} ${id}");

	switch (route) {
		case "home":
			Navigator.push(context,
				MaterialPageRoute(
					builder: (context) => HomeScreen()
				),
			);
			break;
		case "comingsoon":
			Navigator.push(context,
				MaterialPageRoute(
					builder: (context) => ComingSoonScreen()
				),
			);
			break;
		default:
			return null;
	}
}


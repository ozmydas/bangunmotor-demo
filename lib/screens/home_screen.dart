import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';
import 'package:bangunmotor/services/firebasemessaging.dart';


import 'package:bangunmotor/redux/app_state.dart';
import 'package:bangunmotor/redux/actions.dart';

import 'etalase_screen.dart';
import 'comingsoon_screen.dart';
import 'misc/test_screen.dart';
import 'profile_screen.dart';
import 'order/cart_screen.dart';
import 'notificationlist_screen.dart';


/****/

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

/****/

class HomeScreen extends StatefulWidget {
	@override
	_HomeScreenState createState() => new _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
	bool _loading = false;
	int currentTab = 0;
	bool _menuVisible = false;
	PageController pageController;


	@override
	void initState(){
		super.initState();
	    pageController = new PageController();

		firebaseCloudMessaging_Listeners();
	}


	Future<bool> _onWillPop() {
		print(_menuVisible);
		
		return showDialog(
			context: context,
			builder: (context) => new AlertDialog(
				title: new Text('Are you sure?'),
				content: new Text('Do you want to exit an App'),
				actions: <Widget>[
					new FlatButton(
						onPressed: () => Navigator.of(context).pop(false),
						child: new Text('No'),
					),
					new FlatButton(
						onPressed: () => Navigator.of(context).pop(true),
						child: new Text('Yes'),
					),
				],
			),
		) ?? false;
	}

	/****/

	void firebaseCloudMessaging_Listeners() {

		setupFCMListeners(context);

		// if (Platform.isIOS) iOS_Permission();

		// _firebaseMessaging.getToken().then((token){
		// 	print(token);
		// });
	}

	void iOS_Permission() {
		_firebaseMessaging.requestNotificationPermissions(
			IosNotificationSettings(sound: true, badge: true, alert: true)
		);

		_firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings){
			print("Settings registered: $settings");
		});
	}

	/****/

	_changeCurrentTab(int tab) {
	    //Changing tabs from BottomNavigationBar
	    setState(() {
	      currentTab = tab;
	      pageController.jumpToPage(0);
	    });
	}

	/****/

	Widget _modalBottom(BuildContext context){
		return Container(
			child: Column(
				mainAxisSize: MainAxisSize.min,
				children: [
					BottomExpandMenu(),

					Container(
						width: MediaQuery.of(context).size.width,
						height: MediaQuery.of(context).size.height * 0.1,
						color: Colors.blue.shade400,
						child: Material(
							color: bgDark,
							child: InkWell(
								child: Icon(Icons.close, color: Colors.white),
								onTap: () {
									print("closed");
									Navigator.pop(context);
								}
							)
						)
					)
				]
			),
		);
	}


	/****/

	@override
	Widget build(BuildContext context) {

		var _mainBody = Stack(
			children: [

				WillPopScope(
					onWillPop: _onWillPop,
					child: Scaffold(
						body: bodyView(currentTab),
						bottomNavigationBar: BottomNavBar(changeCurrentTab: _changeCurrentTab),
						floatingActionButton: Padding(
				            padding: const EdgeInsets.only(top: 40.0),
							child: FloatingActionButton(
								onPressed: (){
									showModalBottomSheet<void>(context: context, builder: (BuildContext context) {
										return _modalBottom(context);
									});
								},
								tooltip: 'Increment',
								child: new Icon(Icons.group_work, size: 50.0, color: Color.fromRGBO(36,59,85, 1.0)),
								elevation: 4.0,
							),
						),
						floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
					),
				), //first Stack

				if(_menuVisible) Container(
					color: Color.fromRGBO(0, 0, 0, 0.5),
					child: Align(
						alignment: FractionalOffset.bottomCenter,
						child: Column(
							mainAxisAlignment: MainAxisAlignment.end,
							children: [
								BottomExpandMenu(),

								Container(
									width: MediaQuery.of(context).size.width,
									height: MediaQuery.of(context).size.height * 0.1,
									color: Colors.blue.shade400,
									child: Material(
										color: bgDark,
										child: InkWell(
											child: Icon(Icons.close, color: Colors.white),
											onTap: () {
												print("closed");
												setState((){
													_menuVisible = false;
												});
											}
										)
									)
								)
							]
						),
					),
				), //second stack

			]
		);
		
		return StoreConnector<AppState, AppState>(
	        converter: (store) => store.state,
	        builder: (context, state) {
	        	return _mainBody;
	        }
        );

	}

	bodyView(currentTab) {
		List<Widget> tabView = [];
		//Current Tabs in Home Screen...
		switch (currentTab) {
			case 0:
			//Dashboard Page
			tabView = [EtalaseScreen()];
			break;
			case 1:
			//Search Page
			tabView = [ComingSoonScreen()];
			break;
			case 2:
			//categori Page - SKIP
			tabView = [ComingSoonScreen()];
			break;
			case 3:
			//notif Page
			tabView = [NotificationListScreen()];
			break;
			case 4:
			//profile Page
			tabView = [ProfileScreen()];
			break;
		}
		return PageView(controller: pageController, children: tabView);
	}


}

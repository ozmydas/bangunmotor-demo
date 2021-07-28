import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:bangunmotor/redux/app_state.dart';
import 'package:bangunmotor/redux/actions.dart';

import 'package:bangunmotor/screens/home_screen.dart';
import 'package:bangunmotor/screens/search_screen.dart';


class AppBarMinimal extends StatelessWidget implements PreferredSizeWidget{
	final AppState state;
	final String title;

	AppBarMinimal({this.state, this.title}): preferredSize = Size.fromHeight(kToolbarHeight);

	@override
    final Size preferredSize; 


    VoidCallback _redirToHome(BuildContext context){
    	Navigator.pushAndRemoveUntil(context,
			MaterialPageRoute(builder: (context) => HomeScreen()),
			(r) => false
		);
    }


    VoidCallback _redirToSearch(BuildContext context){
    	Navigator.push(context,
			MaterialPageRoute(builder: (context) => SearchScreen()),
		);
    }


	@override
	Widget build(BuildContext context) {
		return AppBar(
			leading: new IconButton(
               icon: new Icon(Icons.chevron_left, color: Colors.white),
               onPressed: () => Navigator.of(context).pop(),
            ), 
			brightness: Brightness.dark, 
			automaticallyImplyLeading: false, // Used for removing back buttoon. 
			title: Text(title, 
				style: TextStyle(color: Colors.white,)
			),
			elevation: 0,
			backgroundColor: bgDark,
			actions: <Widget>[
				Container(
					margin: EdgeInsets.only(right: 0),
					child: IconBadge(myIcon: Icons.search, myText: "", myCallback: () => _redirToSearch(context)),
				),
				Container(
					margin: EdgeInsets.only(right: 10),
					child: IconBadge(myIcon: Icons.home, myText: "", myCallback: () => _redirToHome(context)),
				),
			],
        );
	}

}
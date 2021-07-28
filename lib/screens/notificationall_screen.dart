import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';

import './notificationdetail_screen.dart';

class NotificationAllScreen extends StatefulWidget {
	NotificationAllScreen({Key key, this.title}) : super(key: key);

	final String title;


	@override
	_NotificationAllScreenState createState() => _NotificationAllScreenState();
}

class _NotificationAllScreenState extends State<NotificationAllScreen> {
	Screen size;

	initState(){
		super.initState();
	}

	/****/

		

	/****/
	@override
	Widget build(BuildContext context){

		final _itemTile = ListTile(
	    	contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
	    	leading: Container(
	    		padding: EdgeInsets.only(right: 12.0),
	    		decoration: new BoxDecoration(
	    			border: new Border(
	    				right: new BorderSide(width: 1.0, color: Colors.black)
	    			)
	    		),
	    		child: Icon(Icons.notifications, color: Colors.black),
	    	),
	    	title: Text(
	    		"Lorem Ipsum Dolor Sing Amet",
	    		style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
	    	),
	    	// subtitle: Text("Intermediate", style: TextStyle(color: Colors.black)),
	    	subtitle: Row(
	    		children: <Widget>[
	    			Expanded(child: Text("lorem ipsum dolor sing amet...", style: TextStyle(color: Colors.black))),
	    			// RatingStar(value: 4),
	    		],
	    	),
	    	trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 20.0),
	    	onTap: () {
	    		Navigator.push(
	    			context,
	    			MaterialPageRoute(
	    				builder: (context) => NotificationDetailScreen(code: "tes")
	    			)
	    		);
	    	}
	    );


		final _notificationCard = Card(
			elevation: .5,
			margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
			child: Container(
				decoration: BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1.0)),
				child: _itemTile,
			),
	    );

		return Container(
			child: ListView.builder(
				scrollDirection: Axis.vertical,
				shrinkWrap: true,
				itemCount: 10,
				itemBuilder: (BuildContext context, int index) {
					return _notificationCard;
				},
			),
		);

	}

}
import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


class NotificationDetailScreen extends StatelessWidget {
	final String code;
	
	NotificationDetailScreen({Key key, this.code}) : super(key: key);


	@override
	Widget build(BuildContext context) {


	    final topContentText = Column(
	    	crossAxisAlignment: CrossAxisAlignment.start,
	    	children: <Widget>[
	    	SizedBox(height: 30.0),
	    	// Icon(
	    	// 	Icons.directions_car,
	    	// 	color: Colors.white,
	    	// 	size: 40.0,
	    	// 	),
	    	Container(
	    		width: 90.0,
	    		child: new Divider(color: Colors.green),
	    	),
	    	SizedBox(height: 10.0),
	    	Text(
	    		"Lorem Ipsum",
	    		style: TextStyle(color: Colors.white, fontSize: 45.0),
	    		),
	    	SizedBox(height: 20.0),
	    	],
	    );


	    final bottomContentText = Text(
	    	"lorem ipsum dolor sing amet. lorem ipsum dolor sing amet",
	    	style: TextStyle(fontSize: 18.0),
	    );



	    /****/


	    final topContent = Stack(
	    	children: <Widget>[
		    	Container(
		    		padding: EdgeInsets.only(left: 10.0),
		    		height: MediaQuery.of(context).size.height * 0.3,
		    		decoration: new BoxDecoration(
		    			image: new DecorationImage(
		    				image: new AssetImage("assets/images/retropoly.jpg"),
		    				fit: BoxFit.cover,
						),
					)
				),
		    	Container(
		    		height: MediaQuery.of(context).size.height * 0.3,
		    		padding: EdgeInsets.all(40.0),
		    		width: MediaQuery.of(context).size.width,
		    		decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, .9)),
		    		child: Center(
		    			child: topContentText,
					),
				),
		    	Positioned(
		    		left: 8.0,
		    		top: 60.0,
		    		child: InkWell(
		    			onTap: () {
		 					Navigator.pop(context);
		   				},
		   				child: Icon(Icons.arrow_back, color: Colors.white),
		    		),
		    	)
	    	],
		);


	    final bottomContent = Container(
	    	// height: MediaQuery.of(context).size.height,
	    	width: MediaQuery.of(context).size.width,
	    	// color: Theme.of(context).primaryColor,
	    	padding: EdgeInsets.all(40.0),
	    	child: Center(
	    		child: Column(
	    			children: <Widget>[bottomContentText],
				),
			),
		);

		/****/

		return Scaffold(
			body: Column(
				children: <Widget>[topContent, bottomContent],
			),
		);
	}


}
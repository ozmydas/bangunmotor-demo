import 'package:flutter/material.dart';
import 'package:bangunmotor/widgets/widgets.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => new _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

	@override
	void initState() {
		super.initState();
	}

	@override
	Widget build(BuildContext context) {

		return Scaffold(
			body: Stack(
				children: <Widget>[
					
					Container(
						decoration: BoxDecoration(
							image: DecorationImage(
								image: AssetImage('assets/images/bgsky.png'),
								fit: BoxFit.cover
							) ,
						),
					),
					
					Opacity(
		            	opacity: 0.6,
		            	child: const ModalBarrier(dismissible: false, color: Colors.black),
		          	),

		          	Container(
		          		child: Column(
			          		children: [

			          			Container(
						  			margin: const EdgeInsets.only(top: 60.0, bottom: 30.0),
			          				child: RoundAvatar('assets/images/avatar.png'),
				          		),

			          			BigText("Lorem Ipsum"),

			          			Container(
			  						padding: const EdgeInsets.only(top: 40.0, bottom: 40.0, left: 10.0, right: 10.0),
			          				child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, ed do eiusmod tempor incididunt ut labore et dolore magna aliqua.t enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", 
			          					overflow: TextOverflow.ellipsis,
    									maxLines: 4,
			          					style: TextStyle(fontSize: 16.0, color: Colors.white)
			          				),
			          			),

			          			Container(
			  						margin: const EdgeInsets.only(left: 10.0, right: 10.0),
				          			child: Column(
				          				children: [

				          					ItemButton("FAQ", "http://google.com"),
				          					ItemButton("FAQ", "http://google.com"),

				          				],
				          			),
				          			
				          		),

			          		],
			          	),
		          	),

		          	

				],
			),
		);

	}


}
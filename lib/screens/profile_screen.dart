import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


import './myprofile_screen.dart';
import './workshop/workshop_screen.dart';


class ProfileScreen extends StatefulWidget {
  	@override
  	_ProfileScreenState createState() => new _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
	Screen size;
	TabController _tabController;

	@override
	initState(){
		super.initState();
	}


	@override
	void dispose() {
		super.dispose();
		_tabController.dispose();
	}


	/****/


	@override
	Widget build(BuildContext context) {
		
		_tabController = new TabController(length: 2, vsync: this);

		return Scaffold(
			body: SafeArea(
				child: Column(
					children: <Widget>[

						Material(
                  			color: bgDark,
                  			child: TabBar(
								controller: _tabController,
								indicatorWeight: 3,
								indicatorColor: txtGold,
								tabs: <Widget>[
								Tab(
									child: Text(
										"My Profile",
										style: TextStyle(
											color: Colors.white,
											),
										),
									),
								Tab(
									child: Text(
										"My Workshop",
										style: TextStyle(
											color: Colors.white,
											),
										),
									),
								],
							),
                  		),
			          	
			          	Expanded(
			          		child: TabBarView(
			          			controller: _tabController,
			          			children: <Widget>[

			          				MyProfileScreen(),
			          				// Container(child: Center(child: Text("My Workshop"))),
			          				WorkshopScreen(),

		          				],
		          			),
		          		),

			          	

					],
				),
			),
		);

	}


}
import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


import './notificationall_screen.dart';
import './order/orderlist_screen.dart';


class NotificationListScreen extends StatefulWidget {
	@override
	_NotificationListScreenState createState() => _NotificationListScreenState();
}


class _NotificationListScreenState extends State<NotificationListScreen> with TickerProviderStateMixin{
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
	Widget build(BuildContext context){

		_tabController = new TabController(length: 2, vsync: this);

		return Scaffold(
			body: SafeArea(
				child: Column(
					children: <Widget>[

						Material(
                  			color: bgDark,
                  			child: TabBar(
								controller: _tabController,
								indicatorColor: txtGold,
								indicatorWeight: 3,
								tabs: <Widget>[
								Tab(
									child: Text(
										"All",
										style: TextStyle(
											color: Colors.white,
											),
										),
									),
								Tab(
									child: Text(
										"Order",
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

			          				NotificationAllScreen(),
			          				OrderListScreen(),

		          				],
		          			),
		          		),

			          	

					],
				),
			),
		);

	}

}
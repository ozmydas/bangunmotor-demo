import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:bangunmotor/redux/app_state.dart';
import 'package:bangunmotor/redux/actions.dart';


import 'package:bangunmotor/screens/search_screen.dart';
import 'package:bangunmotor/screens/order/cart_screen.dart';


class AppBarSecond extends StatelessWidget implements PreferredSizeWidget{
	final AppState state;
	final String title;

	AppBarSecond({this.state, this.title}): preferredSize = Size.fromHeight(kToolbarHeight);

	@override
    final Size preferredSize; 

    VoidCallback _redirToSearch(BuildContext context){
    	Navigator.push(context,
			MaterialPageRoute(builder: (context) => SearchScreen()),
		);
    }


    VoidCallback _redirToCart(BuildContext context){
    	Navigator.push(context,
			MaterialPageRoute(builder: (context) => CartScreen()),
		);
    }


	@override
	Widget build(BuildContext context) {
		return AppBar(
			title: Text(title, 
				style: TextStyle(color: Colors.white,)
			),
			leading: new IconButton(
               icon: new Icon(Icons.chevron_left, color: Colors.white),
               onPressed: () => Navigator.of(context).pop(),
            ), 
			automaticallyImplyLeading: false,
			brightness: Brightness.dark,  
			elevation: 0,
			backgroundColor: bgDark,
			actions: <Widget>[
				Container(
					margin: EdgeInsets.only(right: 0),
					child: IconBadge(myIcon: Icons.search, myText: "", myCallback: () => _redirToSearch(context)),
				),
				Container(
					margin: EdgeInsets.only(right: 10.0),
					child: IconBadge(myIcon: Icons.shopping_cart, myText: state.cartQty.toString(), myCallback: () => _redirToCart(context)),
				)
			],
        );
	}

}
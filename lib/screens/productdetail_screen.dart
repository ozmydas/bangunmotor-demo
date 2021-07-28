import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


import 'package:flutter_redux/flutter_redux.dart';
import 'package:bangunmotor/redux/app_state.dart';
import 'package:bangunmotor/redux/actions.dart';

import './order/addtocart_screen.dart';


class ProductDetailScreen extends StatefulWidget {
	ProductDetailScreen({Key key, this.title}) : super(key: key);

	final String title;

	@override
	_ProductDetailScreenState createState() => _ProductDetailScreenState();
}


class _ProductDetailScreenState extends State<ProductDetailScreen> with TickerProviderStateMixin {
	Screen size;

	/****/

	Widget _hero(){
		return Container(
			child: Stack(
				children: [
					Image.network("http://demo.t-hisyam.net/tes/banner/slider1.png"),
					_favorite(),
				],
			)
		);
	}

	Widget _title() {
		return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 12.0),
			child: Center(
				child: Text(
					"Barang Terlarang",
					style: TextStyle(fontSize: 16.0, color: Colors.black),
				),
			),
		);
	} // end title


	Widget _favorite(){
		return Positioned(
	        bottom: 5,
	        right: 20,
			child: FloatingActionButton(
				elevation: 2,
				child: Icon(Icons.favorite, color: Colors.pink),
				backgroundColor: Colors.white,
				onPressed: (){}
			),	
		);
	}


	Widget _description(){
		return Container(
			child: Text(
				"A style icon gets some love from one of today's top "
				"trendsetters. Pharrell Williams puts his creative spin on these "
				"shoes, which have all the clean, classicdetails of the beloved Stan Smith.",
				textAlign: TextAlign.justify,
				style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
			),
			padding: EdgeInsets.all(16)
		);
	}

	Widget _buildProductDetailsPage(BuildContext context){
		return SafeArea(
			child: Column(
				children: <Widget>[
					_hero(),
					SizedBox(height: 20.0),
					_title(),
					SizedBox(height: 15.0),
					LineDivider(color: Colors.grey[600]),
					_description(),
				],
			),
		);
	}

	Widget _buildBottomNavigationBar(AppState state) {
	 	return Container(
	 		width: MediaQuery.of(context).size.width,
	 		height: 50.0,
	 		child: Row(
	 			mainAxisSize: MainAxisSize.max,
	 			mainAxisAlignment: MainAxisAlignment.spaceAround,
	 			children: <Widget>[
		 			Flexible(
		 				flex: 1,
		 				child: RaisedButton(
		 					onPressed: () {

		 						Navigator.push(context, MaterialPageRoute<DismissDialogAction>(
		 							builder: (BuildContext context) => AddToCartScreen(),
		 							fullscreenDialog: true,
		 						));

		 						// int addedQty = 1; // anggap user menambah 1 barang

		 						// StoreProvider.of<AppState>(context)
	        //                     	.dispatch(CartQtyAddAction(addedQty));
		 					},
		 					color: bgDark,
		 					child: Center(
		 						child: Row(
		 							mainAxisAlignment: MainAxisAlignment.center,
		 							children: <Widget>[
			 							Icon(
			 								Icons.card_travel,
			 								color: Colors.white,
			 							),
			 							SizedBox(
			 								width: 4.0,
			 							),
			 							Text(
			 								"Beli",
			 								style: TextStyle(color: Colors.white, fontSize: 22,),
			 							),
			 						],
			 					),
			 				),
			 			),
			 		),
			 	],
			),
		);
	 } 


	Widget _mainBody(BuildContext context, AppState state){
		return Scaffold(
			appBar: AppBarSecond(state: state, title: "Detail Product"),
			body: _buildProductDetailsPage(context),
			bottomNavigationBar: _buildBottomNavigationBar(state),
		);
	}

	/****/

	Widget build(BuildContext context) {

		return StoreConnector<AppState, AppState>(
	        converter: (store) => store.state,
	        builder: (context, state) => _mainBody(context, state),
	    );
	}
	
}
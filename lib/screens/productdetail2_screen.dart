import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


import 'package:flutter_redux/flutter_redux.dart';
import 'package:bangunmotor/redux/app_state.dart';
import 'package:bangunmotor/redux/actions.dart';


class ProductDetailScreen extends StatefulWidget {
	ProductDetailScreen({Key key, this.title}) : super(key: key);

	final String title;

	@override
	_ProductDetailScreenState createState() => _ProductDetailScreenState();
}


class _ProductDetailScreenState extends State<ProductDetailScreen> with TickerProviderStateMixin {
	Screen size;

	/****/

	_buildProductImagesWidgets() {
		TabController imagesController = TabController(length: 3, vsync: this);

		return Padding(
			padding: const EdgeInsets.all(16.0),
			child: Container(
				height: 250.0,
				child: Center(
					child: DefaultTabController(
						length: 3,
						child: Stack(
							children: <Widget>[
							TabBarView(
								controller: imagesController,
								children: <Widget>[
									Image.network("http://demo.t-hisyam.net/tes/banner/slider1.png"),
									Image.network("http://demo.t-hisyam.net/tes/banner/slider2.png"),                                              
									Image.network("http://demo.t-hisyam.net/tes/banner/slider3.png"),
								],
							),
							Container(
								alignment: FractionalOffset(0.5, 0.95),
								child: TabPageSelector(
									controller: imagesController,
									selectedColor: Colors.grey,
									color: Colors.white,
								),
							)
						],
						),
					),
				),
			),
		);
	} // end images


	_buildProductTitleWidget() {
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


	_buildPriceWidgets() {
		return Padding(
			padding: const EdgeInsets.symmetric(horizontal: 12.0),
			child: Row(
				mainAxisAlignment: MainAxisAlignment.start,
				mainAxisSize: MainAxisSize.max,
				children: <Widget>[
				Text(
					"Rp."+"12.000",
					style: TextStyle(fontSize: 16.0, color: Colors.black),
				),
				SizedBox(
					width: 8.0,
				),
				Text(
					"15.000",
					style: TextStyle(
						fontSize: 12.0,
						color: Colors.grey,
						decoration: TextDecoration.lineThrough,
					),
				),
			],
			),
		);
	} // end price


	_buildDetailsAndMaterialWidgets() {
		TabController tabController = new TabController(length: 2, vsync: this);
		return Container(
			child: Column(
				crossAxisAlignment: CrossAxisAlignment.start,
				mainAxisSize: MainAxisSize.min,
				children: <Widget>[
				TabBar(
					controller: tabController,
					tabs: <Widget>[
					Tab(
						child: Text(
							"DETAILS",
							style: TextStyle(
								color: Colors.black,
								),
							),
						),
					Tab(
						child: Text(
							"MATERIAL & CARE",
							style: TextStyle(
								color: Colors.black,
								),
							),
						),
					],
					),
				Container(
					padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
					height: 40.0,
					child: TabBarView(
						controller: tabController,
						children: <Widget>[
						Text(
							"76% acrylic, 19% polyster, 5% metallic yarn Hand-wash cold",
							style: TextStyle(
								color: Colors.black,
								),
							),
						Text(
							"86% acrylic, 9% polyster, 1% metallic yarn Hand-wash cold",
							style: TextStyle(
								color: Colors.black,
								),
							)
						],
						),
					),
				],
				),
			);
	} // detail tab


	_buildMoreInfoHeader() {
		return Padding(
			padding: const EdgeInsets.only(
				left: 12.0,
				),
			child: Text(
				"MORE INFO",
				style: TextStyle(
					color: Colors.grey[800],
				),
			),
		);
		} // more head

	_buildMoreInfoData() {
		return Padding(
			padding: const EdgeInsets.only(
				left: 12.0,
				),
			child: Column(
				children: [
					Text(
						"Product Code: 410\nTax info: Applicable GST will be charged at the time of chekout",
						style: TextStyle(
							color: Colors.grey[600],
						),
					),
					SizedBox(height: 100.0),
					Text(
						"Product Code: 410\nTax info: Applicable GST will be charged at the time of chekout",
						style: TextStyle(
							color: Colors.grey[600],
						),
					),
					SizedBox(height: 100.0),
					Text(
						"Product Code: 410\nTax info: Applicable GST will be charged at the time of chekout",
						style: TextStyle(
							color: Colors.grey[600],
						),
					),
				],
			), 
			
		);
	} // more data


	 _buildBottomNavigationBar(AppState state) {
	 	return Container(
	 		width: MediaQuery.of(context).size.width,
	 		height: 50.0,
	 		child: Row(
	 			mainAxisSize: MainAxisSize.max,
	 			mainAxisAlignment: MainAxisAlignment.spaceAround,
	 			children: <Widget>[
	 			// Flexible(
	 			// 	fit: FlexFit.tight,
	 			// 	flex: 1,
	 			// 	child: RaisedButton(
	 			// 		onPressed: () {},
	 			// 		color: Colors.grey,
	 			// 		child: Center(
	 			// 			child: Row(
	 			// 				mainAxisAlignment: MainAxisAlignment.center,
	 			// 				children: <Widget>[
	 			// 				Icon(
	 			// 					Icons.list,
	 			// 					color: Colors.white,
	 			// 				),
	 			// 				SizedBox(
	 			// 					width: 4.0,
	 			// 				),
	 			// 				Text(
	 			// 					"SAVE",
	 			// 					style: TextStyle(color: Colors.white),
	 			// 				),
	 			// 			],
					// 		),
	 			// 		),
	 			// 	),
	 			// ),
	 			Flexible(
	 				flex: 1,
	 				child: RaisedButton(
	 					onPressed: () {
	 						int addedQty = 1; // anggap user menambah 1 barang

	 						StoreProvider.of<AppState>(context)
                            	.dispatch(CartQtyAddAction(addedQty));
	 					},
	 					color: Colors.blue.shade400,
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
	 								"ADD TO CART",
	 								style: TextStyle(color: Colors.white),
	 							),
	 						],
	 						),
	 					),
	 				),
	 			),
	 		],
	 		),
	 	);
	 } // end bottom bar


	/****/

	_buildProductDetailsPage(BuildContext context) {
		return ListView(
			children: <Widget>[
				Container(
					padding: const EdgeInsets.all(4.0),
					child: Card(
						elevation: 4.0,
						child: Column(
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[

							_buildProductImagesWidgets(),
							_buildProductTitleWidget(),
							SizedBox(height: 12.0),
							_buildPriceWidgets(),
							SizedBox(height: 12.0),
							LineDivider(color: Colors.grey[600]),
							SizedBox(height: 12.0),
							_buildDetailsAndMaterialWidgets(),
							LineDivider(color: Colors.grey[600]),
							SizedBox(height: 12.0),
							_buildMoreInfoHeader(),
							SizedBox(height: 12.0),
							_buildMoreInfoData(),
							SizedBox(height: 12.0),
							
						],
						),
					),
				),
			],
		);
	} // widget


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
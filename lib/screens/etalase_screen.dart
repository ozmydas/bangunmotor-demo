import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:bangunmotor/redux/app_state.dart';
import 'package:bangunmotor/redux/actions.dart';

import './productdetail_screen.dart';


/****/

class EtalaseScreen extends StatefulWidget {
	@override
	_EtalaseScreenState createState() => new _EtalaseScreenState();
}


class _EtalaseScreenState extends State<EtalaseScreen> {
	bool _loading = false;

	/****/

	@override
	void initState(){
		super.initState();
	} // end init


	var banner = CarouselSlider(
		height: 200.0,
		enableInfiniteScroll: true,
		reverse: false,
		autoPlay: true,
		enlargeCenterPage: true,
		items: [1,2,3].map((i) {
			return Builder(
				builder: (BuildContext context) {
					return Container(
						margin: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 15.0),
						child: Material(
							shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(5.0) ),
        					elevation: 8.0,
							child: ClipRRect(
								borderRadius: BorderRadius.all(Radius.circular(5.0)),
								child: Container(
									child: Image.network(
										'http://demo.t-hisyam.net/tes/banner/slider' + i.toString() + '.png', 
										fit: BoxFit.cover, width: 1000.0
									),
								),
							),
						),
					);
				},
			);
		}).toList(),
	);


	Widget _rowEtalase(BuildContext context, String title){
		Screen size = Screen(MediaQuery.of(context).size);

		return Column(
			children: [

				LineDivider(),
				SizedBox(height: 10.0),

				PadLeftAlignText(
	                text: title,
	                leftPadding: size.getWidthPx(16),
	                textColor: textPrimaryColor,
	                fontSize: 18.0
                ),

                Container(
					margin: const EdgeInsets.only(bottom: 30.0),
					height: 200.0,
					child: ListView.builder(
						scrollDirection: Axis.horizontal,
						itemCount: 6,
						itemBuilder: (context, index) {
							return InkWell(
								child: ProductCard(),
								onTap: (){
					            	Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen()));
								}
							);
						},
					),
				),

			]
		);
	} // end func


	Future<void> _refreshScreenData() async{
		print("refreshing data...");
	} // end func


	/****/

	Widget _mainBody(AppState state){
		return Scaffold(
			appBar: AppBarMain(state: state),
			body: RefreshIndicator(
				onRefresh: _refreshScreenData,
				child: Container(
					color: Colors.white,
					child: CustomScrollView(
						slivers: <Widget>[
							
							SliverList(
								delegate: SliverChildListDelegate(
									[
										Container(
											// decoration: BoxDecoration(color: Colors.amber),
											padding: const EdgeInsets.only(top: 20.0),
											width: MediaQuery.of(context).size.width,
											child: banner,
										),
									],
								),
							), 

							SliverToBoxAdapter(
								child: Container(
									margin: const EdgeInsets.only(top: 30.0, bottom: 30.0),
									height: 80.0,
									child: ListView.builder(
										scrollDirection: Axis.horizontal,
										itemCount: 10,
										itemBuilder: (context, index) {
											return Container(
												width: 200.0,
												child: Card(
													color: Colors.blue.shade400,
													child: Center(
														child: Text('KATEGORI X', style: TextStyle(color: Colors.white)),
													),
												),
											);
										},
									),
								),
							),

							SliverToBoxAdapter(
								child: Column(
									children: [
										_rowEtalase(context, "Hot Item Kekinian"),
										_rowEtalase(context, "Paling Laris Manis"),
										_rowEtalase(context, "Sesuai Minat Kamu"),
									]
								)
							),
	
						],
					),
				),
			)
		);
	}


	/****/

	@override
	Widget build(BuildContext context) {
		Screen size = Screen(MediaQuery.of(context).size);


	 // end return


		Padding leftAlignText({text, leftPadding, textColor, fontSize, fontWeight}) {
			return Padding(
				padding: EdgeInsets.only(left: leftPadding),
				child: Align(
					alignment: Alignment.centerLeft,
					child: Text(text??"",
						textAlign: TextAlign.left,
						style: TextStyle(
							fontSize: fontSize,
							fontWeight: fontWeight ?? FontWeight.w500,
							color: textColor
						)
					),
				),
			);
		} // end leftalign


		return StoreConnector<AppState, AppState>(
	        converter: (store) => store.state,
	        builder: (context, state) => _mainBody(state),
	    );

	} // end build

}

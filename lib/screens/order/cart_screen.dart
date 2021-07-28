import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';
import 'package:bangunmotor/models/cart_model.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:bangunmotor/redux/app_state.dart';


class CartScreen extends StatefulWidget {
	@override
	_CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
	Screen size;
	List<CartItem> _itemsCartData;
	bool _isLoading, _isError;


	@override
	initState(){
		super.initState();

		// define empty cart items
		setState((){
			_itemsCartData = [];
		});
		
		_getCartItemsRequest();
	}


	/** method for get cart item list and other **/ 

	void _getCartItemsRequest() async{
		print("trying get cart list");

		// find user id
		var userId = 1; // fake id for placeholder
		var cartUrl = ApiUrl.ORDER_CART_LIST;

		// show loading while sending request
		setState((){
			_isLoading = true;
		});

		// send request to get items based on id
		http.Response response;

		try{
			response = await http.get(cartUrl).timeout(const Duration(seconds: 10));
		} on TimeoutException catch (e) {
			print("timeout");
		} catch (err) {
			print(err);
			setState((){
				_isLoading = false;
				_isError = true;
			});
			return null;
		}

		if(response.statusCode != 200){
			// in this case something error
			print("error occured : 101");
			setState((){
				_isLoading = false;
			});
		} else {
			// get json
			var parsedJson = convert.jsonDecode(response.body);
			// print(parsedJson);
			var status = parsedJson['status'];
			var message = parsedJson['message'];
			var listData = parsedJson['data'] as List;
			// print(listData);
			CartItemList data = new CartItemList.fromJson(listData);

			// change state here
			setState((){
				_isLoading = false;
				_itemsCartData = data.items;
			});
		}
	}


	/** render widget below here **/

	Widget _renderOpsi(BuildContext context, String title, Widget trail){
		return ListTile(
			contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
	    	leading: Container(
	    		padding: EdgeInsets.only(right: 12.0),
	    		child: Icon(Icons.notifications, color: Colors.black),
	    	),
	    	title: Text(
	    		title,
	    		style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
	    	),
	    	trailing: trail,
		);
	}


	Widget _nextBtn(BuildContext context){
		return Container(
			padding: const EdgeInsets.symmetric(horizontal: 10.0),
			child: Material(
				elevation: 5.0,
				color: bgDark,
				child: MaterialButton(
					minWidth: MediaQuery.of(context).size.width,
					padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
					onPressed: () {
						// continue to pengiriman atau payment
					},
					child: Center(
						child: Row(
							mainAxisSize: MainAxisSize.min,
							children: [
								Text("SELANJUTNYA",
									textAlign: TextAlign.center,
									style: TextStyle(
										color: Colors.white, fontWeight: FontWeight.bold
									)
								),
								Icon(Icons.keyboard_arrow_right, color: Colors.white),
							]
						)
					)
				),
			)
        );
	}


	Widget _mainBody(BuildContext context, AppState state){
		return Scaffold(
			appBar:  AppBarMinimal(state: state, title: "My Cart"),
			body: SingleChildScrollView(
				child: Column(
					children: [

						Card(
							elevation: 5.0,
							child: ListView.builder(
								scrollDirection: Axis.vertical,
								shrinkWrap: true,
								itemCount: 5,
								itemBuilder: (BuildContext context, int index) {

									return ListTile(
								    	contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
								    	leading: SizedBox(
											height: 120.0,
											child: Image.asset(
												"assets/images/ufo.png",
												fit: BoxFit.contain,
											),
										),
								    	title: Text(
								    		"Lorem Ipsum Dolor",
								    		style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
								    	),
								    	subtitle: Text("Rp 1.000", style: TextStyle(color: Colors.black)),
								    	trailing: Icon(Icons.delete_forever, color: Colors.red, size: 20.0),
									);

								},
							),
						), // end product

						SizedBox(height: 20),
						
						PadLeftAlignText(
			                text: "Opsi",
			                leftPadding: size.getWidthPx(16),
			                textColor: textPrimaryColor,
			                fontSize: 18.0
		                ),

		                Card(
							elevation: 5.0,
							child: Column(
								children: [
									_renderOpsi(context, "Kode Promo", Icon(Icons.keyboard_arrow_right)),
									LineDivider(),
									_renderOpsi(context, "Asuransi", Icon(Icons.keyboard_arrow_right)),
								],
							)
						),

						SizedBox(height: 20),
						
						PadLeftAlignText(
			                text: "Detail Biaya",
			                leftPadding: size.getWidthPx(16),
			                textColor: textPrimaryColor,
			                fontSize: 18.0
		                ),

		                Card(
							elevation: 5.0,
							child: Column(
								children: [
									_renderOpsi(context, "Biaya Kirim", Text('Rp. 5.000')),
									LineDivider(),
									_renderOpsi(context, "Total Harga", Text('Rp. 7.000')),
								],
							)
						),

						SizedBox(height: 20),
						_nextBtn(context),
						SizedBox(height: 20),



					]
				)
			),
		);
	}


	@override
	Widget build(BuildContext context){
		size = Screen(MediaQuery.of(context).size);

		return StoreConnector<AppState, AppState>(
	        converter: (store) => store.state,
	        builder: (context, state) => _mainBody(context, state),
	    );

	}



}
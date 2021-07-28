import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


import './cart_screen.dart';

enum DismissDialogAction {
	cancel,
	discard,
	save,
}


class AddToCartScreen extends StatefulWidget {
	@override
	AddToCartScreenState createState() => AddToCartScreenState();
}

class AddToCartScreenState extends State<AddToCartScreen> {
	String _eventName;
	int _itemCount = 1;


	/****/

	void showDemoDialog<T>({ BuildContext context, Widget child }) {
		showDialog<T>(
			barrierDismissible: false,
			context: context,
			builder: (BuildContext context) => child,
			)
		.then<void>((T value) { // The value passed to Navigator.pop() or null.
			// if (value != null) {
			// 	_scaffoldKey.currentState.showSnackBar(SnackBar(
			// 		content: Text('You selected: $value'),
			// 	));
			// }
		});
	}

	
	Widget DialogItem(BuildContext context, String text, Color color, VoidCallback onPressed){
		return Padding(
			padding: EdgeInsets.symmetric(horizontal: 20.0),
			child: RaisedButton(
				color: color,
				child: Text(text, semanticsLabel: text, style: TextStyle(color: Colors.white)),
				onPressed: onPressed,
			)
		);
	}


	Widget _qtyEditor(){
		return Row(
			children: <Widget>[
				_itemCount!=0? new  IconButton(icon: new Icon(Icons.remove),onPressed: ()=>setState(()=>_itemCount--),):new Container(),
				new Text(_itemCount.toString()),
				new IconButton(icon: new Icon(Icons.add),onPressed: ()=>setState(()=>_itemCount++))
			],
		);
	}


	Widget _submitBtn(BuildContext context){
		return Material(
			elevation: 5.0,
			borderRadius: BorderRadius.circular(30.0),
			color: bgDark,
			child: MaterialButton(
				minWidth: MediaQuery.of(context).size.width,
				padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
				onPressed: () {
					// Navigator.pop(context, DismissDialogAction.save);

					showDemoDialog<String>(
						context: context,
						child: SimpleDialog(
							title: const Text('Terima Kasih'),
							children: <Widget>[
								Center(
									child: Text('Produk berhasil ditambahkan ke Keranjang Belanja.')
								),
								SizedBox(height: 10),
								LineDivider(),
								SizedBox(height: 10),
								DialogItem(context, 'Lihat Keranjang Belanja', Colors.green, (){
									Navigator.pop(context);
									Navigator.pop(context);
									Navigator.of(context).pushReplacement(
										MaterialPageRoute(builder: (context) => CartScreen())
									);
								}),
								DialogItem(context, 'Lanjutkan Berbelanja', bgDark, (){
									Navigator.pop(context);
									Navigator.pop(context);
									Navigator.pop(context);
								}),
							],
						),
					);

				},
				child: Text("Tambahkan ke Cart",
					textAlign: TextAlign.center,
					style: TextStyle(
						color: Colors.white, fontWeight: FontWeight.bold
					)
				),
			),
        );
	}


	/****/


	@override
	Widget build(BuildContext context) {
		final ThemeData theme = Theme.of(context);

		return Scaffold(
			appBar: AppBar(
				title: Text('Tambah Keterangan',
					style: TextStyle(color: Colors.white,)
				),	
				leading: new IconButton(
	               icon: new Icon(Icons.close, color: Colors.white),
	               onPressed: () => Navigator.of(context).pop(),
	            ), 
				automaticallyImplyLeading: false,
				brightness: Brightness.dark, 
				elevation: 0,
				backgroundColor: bgDark,
			),
			body: Form(
				child: Scrollbar(
					child: ListView(
						padding: const EdgeInsets.all(16.0),
						children: <Widget>[

							Container(
								padding: const EdgeInsets.symmetric(vertical: 8.0),
								alignment: Alignment.bottomLeft,
								child: TextField(
									decoration: const InputDecoration(
										labelText: 'Keterangan (opsional)',
										filled: true,
										),
									// style: theme.textTheme.headline,
									onChanged: (String value) {
									},
								),
							),

							_qtyEditor(),

							// disini jumlah qty
							SizedBox(height: 5.0),

							// add
							_submitBtn(context),

						]
						.map<Widget>((Widget child) {
							return Container(
								padding: const EdgeInsets.symmetric(vertical: 8.0),
								child: child,
							);
						})
					.toList(),
					),
				),
			),
		);
	}
}

import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


import '../notificationall_screen.dart';


class OrderListScreen extends StatefulWidget {
	@override
	_OrderListScreenState createState() => _OrderListScreenState();
}


class _OrderListScreenState extends State<OrderListScreen> with TickerProviderStateMixin{
	Screen size;

	@override
	initState(){
		super.initState();
	}


	@override
	void dispose() {
		super.dispose();
	}


	/****/

	Widget _menuTile(IconData icon, String title, String subtitle, int jml){
		return ListTile(
	    	contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
	    	leading: Container(
	    		child: Icon(icon),
	    	),
	    	title: Text(
	    		title,
	    		style: TextStyle(fontWeight: jml > 0 ? FontWeight.bold : FontWeight.normal),
	    	),
	    	subtitle: Text(subtitle, style: TextStyle()),
	    	trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 20.0),
	    	onTap: () {
	    		
	    	}
	    );
	}


	Widget _menuListBuy(BuildContext context){
		return Column(
			children: [

				SizedBox(height: 20),
				Text("Notifikasi Pembelian", style: 
					TextStyle(
						color: Colors.blue[800],
						fontWeight: FontWeight.bold,
						fontSize: 20
					)
				),
				_menuTile(Icons.shopping_basket, "Belum Dibayar", "1 order menunggu pembayaran", 1),
				_menuTile(Icons.shopping_basket, "Sedang Diproses", "0 order diproses seller", 0),
				_menuTile(Icons.shopping_basket, "Dalam Pengiriman", "0 order sedang dikirim", 0),
				_menuTile(Icons.shopping_basket, "Barang Diterima", "0 order sampai ditujuan", 0),
			],
	    );
	} // end menu buyer


		Widget _menuListSell(BuildContext context){
		return Column(
			children: [
				SizedBox(height: 20),
				Text("Notifikasi Penjualan", style: 
					TextStyle(
						color: Colors.green[800],
						fontWeight: FontWeight.bold,
						fontSize: 20
					)
				),
				_menuTile(Icons.shopping_basket, "Belum Dibayar", "0 order belum dibayar buyer", 0),
				_menuTile(Icons.shopping_basket, "Siap Diproses", "1 order menunggu diproses", 1),
				_menuTile(Icons.shopping_basket, "Siap Dikirim", "0 order menunggu dikirim", 0),
				_menuTile(Icons.shopping_basket, "Dalam Pengiriman", "1 order sedang dikirim", 1),
				_menuTile(Icons.shopping_basket, "Menunggu Review", "0 order belum direview buyer", 0),
			],
		);
	} // end menu seller


	Widget _mainBody(Buildcontext){
		return Container(
			child: ListView(
				children: [
					SizedBox(height: 5),
					Card(
						elevation: 2,
						child: _menuListBuy(context)
					),
					SizedBox(height: 15),
					Card(
						elevation: 2,
						child: _menuListSell(context),
					),
					SizedBox(height: 10),
				],
		    ),
		);
	}


	/****/
		
	@override
	Widget build(BuildContext context){


		return Scaffold(
			body: SafeArea(
				child: _mainBody(context),
			),
		);

	}

}
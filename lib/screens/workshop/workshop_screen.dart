import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';



class WorkshopScreen extends StatefulWidget {
  	@override
  	_WorkshopScreenState createState() => new _WorkshopScreenState();
}


class _WorkshopScreenState extends State<WorkshopScreen>  with TickerProviderStateMixin {
	TabController _tabController;

	@override
	initState(){
		super.initState();
	}


	@override
	void dispose() {
		super.dispose();
		// _tabController.dispose();
	}

	Widget _menuTile(IconData icon, String title, String subtitle){
		return ListTile(
	    	contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
	    	leading: Container(
	    		child: Icon(icon),
	    	),
	    	title: Text(
	    		title,
	    	),
	    	subtitle: Text(subtitle, style: TextStyle()),
	    	trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 20.0),
	    	onTap: () {
	    		
	    	}
	    );
	}

	
	Widget _shopTitleDesc(){
		return Column(
			children: [
				Text("Toko Lorem Ipsum"),
				Text("lorem ipsum dolor"),
			],
		);
	} // end widget


	Widget _shopHeader(){
		return Center(
			child: Column(
				children: [
					// pic
					RoundAvatar('assets/images/ufo.png'),
					// info
					_shopTitleDesc(),
				],
			)
		);
	} // end widget


	Widget _shopMenuGrid(){
		return GridView.count(
			shrinkWrap: true,
			childAspectRatio: 3,
			mainAxisSpacing: 5.0,
			crossAxisSpacing: 5.0,
			crossAxisCount: 2,
			children: <Widget>[
			Container(
				color: bgDark,
				child: Center(
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Icon(Icons.find_in_page, color: Colors.white),
							Text("Tambah Produk",
								style: TextStyle(color: Colors.white, fontSize: 14.0),
							),
						]
					)
				),
			),
			Container(
				color: bgDark,
				child: Center(
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Icon(Icons.find_in_page, color: Colors.white),
							Text("Kelola Produk",
								style: TextStyle(color: Colors.white, fontSize: 14.0),
							),
						]
					)
				),
			),
			Container(
				color: bgDark,
				child: Center(
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Icon(Icons.find_in_page, color: Colors.white),
							Text("Edit Info",
								style: TextStyle(color: Colors.white, fontSize: 14.0),
							),
						]
					)
				),
			),
			Container(
				color: bgDark,
				child: Center(
					child: Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Icon(Icons.find_in_page, color: Colors.white),
							Text("Order Masuk",
								style: TextStyle(color: Colors.white, fontSize: 14.0),
							),
						]
					)
				),
			),
			],
		);
	}


	Widget _shopMenuExtra(){
		return Column(
			children: [
				_menuTile(Icons.filter_b_and_w, "Diskusi Produk", "Lihat pertanyaan produk dari customer"),
				_menuTile(Icons.filter_b_and_w, "Rating Workshop", "Rating terbaru yang diberikan customer"),
				_menuTile(Icons.filter_b_and_w, "Informasi Statistik", "lihat statistik workshop kamu"),
			],
		);
	}


	Widget _mainBody(BuildContext context){
		return Column(
			children: [
				
				SizedBox(height: 10),
				Padding(
					padding: EdgeInsets.symmetric(horizontal: 10.0),
					child: Card(
						elevation: 2,
						child: Padding(
							padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
							child: _shopHeader(),
						),
					),
				),

				SizedBox(height: 20),
				Padding(
					padding: EdgeInsets.symmetric(horizontal: 15.0,),
					child: _shopMenuGrid(),
				),
				
				SizedBox(height: 20),
				Padding(
					padding: EdgeInsets.symmetric(horizontal: 10.0),
					child: Card(
						elevation: 2,
						child: Padding(
							padding: EdgeInsets.only(top: 10.0, bottom: 30.0),
							child: _shopMenuExtra(),
						)
					),
				),
			]
		);
	}


	Widget build(BuildContext context){
		return Scaffold(
			body: SafeArea(
				child: _mainBody(context),
			)
		);
	}

}

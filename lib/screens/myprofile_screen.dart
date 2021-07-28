import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


import './login_screen.dart';


class MyProfileScreen extends StatefulWidget {
  @override
  _MyProfileScreenState createState() => new _MyProfileScreenState();
}


class _MyProfileScreenState extends State<MyProfileScreen> with TickerProviderStateMixin {

	@override
	void initState() {
		super.initState();
	}


	Widget _menuTile(IconData icon, String title, String subtitle){
		return ListTile(
	    	contentPadding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
	    	leading: Container(
	    		child: Icon(icon),
	    	),
	    	title: Text(
	    		title,
	    		style: TextStyle(fontWeight: FontWeight.bold),
	    	),
	    	subtitle: Text(subtitle, style: TextStyle()),
	    	trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 20.0),
	    	onTap: () {
	    		
	    	}
	    );
	}


	Widget _logoutBtn(BuildContext context){
		return Material(
			elevation: 5.0,
			borderRadius: BorderRadius.circular(30.0),
			color: bgDark,
			child: MaterialButton(
				minWidth: MediaQuery.of(context).size.width,
				padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
				onPressed: () {
					LocalStorage.sharedInstance.writeValue(key:Constants.isLoggedIn,value: "0");
					Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
				},
				child: Text("Logout",
					textAlign: TextAlign.center,
					style: TextStyle(
						color: Colors.white, fontWeight: FontWeight.bold
					)
				),
			),
        );
	}


	@override
	Widget build(BuildContext context) {

		return Container(
      		color: Colors.white,
      		child: Column(
          		children: [

          			Container(
			  			margin: const EdgeInsets.only(top: 60.0, bottom: 30.0),
          				child: RoundAvatar('assets/images/ufo.png'),
	          		),

	          		Container(
          				child: Center(
          					child: Text("email@email.com", style: TextStyle(
									fontSize: 20.0, fontWeight: FontWeight.bold
								)
							)
          				)
	          		),


					SizedBox(height: 40.0),
  					LineDivider(),

          			Container(
  						margin: const EdgeInsets.only(left: 10.0, right: 10.0),
	          			child: Column(
	          				children: [

	          					_menuTile(Icons.shopping_basket, "Orders", "Cek riwayat pesanan"),
	          					_menuTile(Icons.account_box, "Profile", "Ubah informasi data diri"),
	          					_menuTile(Icons.map, "Address", "Atur alamat tersimpan"),
	          					LineDivider(),
								SizedBox(height: 40.0),
	          					_logoutBtn(context),

	          				],
	          			),
	          			
	          		),

          		],
          	),
      	);

	}


}


import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


import 'package:bangunmotor/screens/productlist_screen.dart';


class BottomExpandMenu extends StatefulWidget {
	@override
	_BottomExpandMenuState createState() => _BottomExpandMenuState();
}

class _BottomExpandMenuState extends State<BottomExpandMenu> {
	Screen size;
	final List<String> _listViewData = [
		"ZERO-ONE",
		"ZERO-TWO!",
		"ZERO-THREE!",
		"ZERO-FOUR!",
		"ZERO-FIVE!",
		"ZERO-SIX!",
	];

	@override
	void initState() {
		super.initState();
	}

	/****/



	/****/

	@override
	Widget build(BuildContext context) {
		size = Screen(MediaQuery.of(context).size);
		return Container(
			color: bgDark,
			child: GridView.count(
				childAspectRatio: 1.5,
				shrinkWrap: true,
				crossAxisCount: 3,
				padding: EdgeInsets.all(8.0),
				crossAxisSpacing: 8.0,
				mainAxisSpacing: 5.0,
				children: _listViewData
				.map((data) => Card(
					child: InkWell(
						onTap: (){
							Navigator.push(context,
								MaterialPageRoute(builder: (context) => ProductListScreen()),
							);
						},
						child: Center(
							child: Padding(
								padding: const EdgeInsets.all(15.0),
								child: Text(data),
								)
							),
						)
					)
				).toList(),
			),
		);
	}

}
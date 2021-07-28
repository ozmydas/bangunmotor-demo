import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


class TestScreen extends StatefulWidget {
	@override
	_TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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
			color: Colors.blue.shade400,
			child: GridView.count(
				childAspectRatio: 1.5,
				shrinkWrap: true,
				crossAxisCount: 3,
				padding: EdgeInsets.all(8.0),
				crossAxisSpacing: 8.0,
				mainAxisSpacing: 5.0,
				children: _listViewData
				.map((data) => Card(
					child: Center(
						child: Padding(
							padding: const EdgeInsets.all(15.0),
							child: Text(data),
							)
						),
					)
				).toList(),
			),
		);
	}

}
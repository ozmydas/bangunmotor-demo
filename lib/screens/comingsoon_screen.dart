import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


class ComingSoonScreen extends StatefulWidget {
	@override
	_ComingSoonScreenState createState() => _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
	Screen size;

	@override
	void initState() {
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		size = Screen(MediaQuery.of(context).size);
		return Scaffold(
			appBar: AppBar(
				centerTitle: true,
				title: Text("Coming Soon", style:
					TextStyle(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.bold)
				),
				backgroundColor: bgDark,
			),
			body: Container(
				color: bgDark,
				child: Stack(
					// fit: StackFit.expand,
					children: [

						ClipPath(
							clipper: BottomRoundClip(),
							child: Container(
								color: Colors.white,
								height: MediaQuery.of(context).size.height * 0.8,
							)
						),

						Center(
							child: Container(
								width: size.getWidthPx(300),
								height: size.getWidthPx(300),
								child: Image.asset("assets/images/comingsoon.gif")
							),
						),

					],
				),
			)
		);
	}

}
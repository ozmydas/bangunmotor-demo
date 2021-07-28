import 'package:flutter/material.dart';

class LineDivider extends StatelessWidget {
	// property
	final Color color;

	// construct
	LineDivider({Key key, this.color = Colors.grey}) 
	: assert(color != null),
	super(key: key);

	// build
	@override
	Widget build(BuildContext context) {
		Size screenSize = MediaQuery.of(context).size;
		
		return Column(
			children: <Widget>[
				Container(
					color: color,
					width: screenSize.width,
					height: 0.25,
				),
			],
		);
	}
}
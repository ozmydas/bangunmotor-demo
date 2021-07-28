import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
	// property
	final String text;

	// construct
	BigText(this.text);

	@override
	Widget build(BuildContext context) {
		return Text(
			text,
			style: TextStyle(fontSize: 30.0, color: Colors.white),
		);
	}
}
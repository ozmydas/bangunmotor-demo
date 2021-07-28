import 'package:flutter/material.dart';

class RoundAvatar extends StatelessWidget {
	// property
	final String text;

	// construct
	RoundAvatar(this.text);

	@override
	Widget build(BuildContext context) {
		return Container(
  			width: 130.0,
  			height: 130.0,
  			decoration: BoxDecoration(
  				shape: BoxShape.circle,
  				border: Border.all(color: Colors.white30),
  			),
  			padding: const EdgeInsets.all(3.0),
  			child: ClipOval(
  				child: Image.asset(text),
  			),
  		);
	}
}
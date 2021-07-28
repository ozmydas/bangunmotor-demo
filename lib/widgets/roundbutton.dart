import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
	// property
	final String text;
	Color textColor = Colors.white;
	Color color = Colors.lightBlueAccent;
	final VoidCallback onPressed;


	// construct
	RoundButton({
		@required String this.text,
		Color this.textColor,
		Color this.color,
		VoidCallback this.onPressed
	});

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.symmetric(vertical: 16.0),
			child: RaisedButton(
					textColor: textColor,
					color: Colors.red,
					child: Text(text, style: TextStyle(color: textColor)),
					shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
					onPressed: onPressed,
				),
			);
	}
}
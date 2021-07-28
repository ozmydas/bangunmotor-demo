import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
	final int value;
	
	const RatingStar({Key key, this.value = 0}):
	assert(value != null),
	super(key: key);

	@override
	Widget build(BuildContext context) {
		return Row(
			mainAxisSize: MainAxisSize.min,
			children: List.generate(5, (index) {
				return Icon(
					index < value ? Icons.star : Icons.star_border,
					color: Colors.yellow,
					size: 14.0
				);
			}),
		);
	}
}
import 'package:flutter/material.dart';

class IconBadge extends StatelessWidget {

	final IconData myIcon;
	final String myText;
	final VoidCallback myCallback;

	IconBadge({
		this.myIcon,
		this.myText,
		this.myCallback,
	});

	Widget _icon(){
		return IconButton(
			icon: Icon(myIcon), 
			onPressed: myCallback,
			color: Colors.white,
		);
	}

	Widget _badge(){
		if(myText == ""){
			return Container();
		}

		return Positioned(
			right: 11,
			top: 11,
			child: new Container(
				padding: EdgeInsets.all(2),
				decoration: new BoxDecoration(
					color: Colors.red,
					borderRadius: BorderRadius.circular(6),
				),
				constraints: BoxConstraints(
					minWidth: 14,
					minHeight: 14,
				),
				child: Text(myText,
					style: TextStyle(
						color: Colors.white,
						fontSize: 8,
					),
					textAlign: TextAlign.center,
				),
			),
		);
	}


	@override
	Widget build(BuildContext context) {

		return Container(
        	margin: const EdgeInsets.only(top: 3.0),
			child: Stack(
				children: [

					_icon(),
					_badge(),

				],
			)
		);

	}

}
import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';

class ProductCard extends StatelessWidget {
	Screen size;
	
	@override
	Widget build(BuildContext context) {

		size = Screen(MediaQuery.of(context).size);
		
		return Card(
	        elevation: 4.0,
	        margin: EdgeInsets.all(8),
	        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
	        borderOnForeground: true,
	        child: Container(
	            height: size.getWidthPx(120),
	            width: size.getWidthPx(150),
	            child: Column(
	            	crossAxisAlignment: CrossAxisAlignment.stretch,
	            	children: <Widget>[
		            	ClipRRect(
		                    borderRadius: BorderRadius.only(
		                        topLeft: Radius.circular(12.0),
		                        topRight: Radius.circular(12.0)),
		                    child: Image.asset('assets/images/retropoly.jpg',
		                        fit: BoxFit.fill)),
		                SizedBox(height: size.getWidthPx(8)),
		                PadLeftAlignText(
		                    text: "Lorem Ipsum",
		                    leftPadding: size.getWidthPx(8),
		                    textColor: colorCurve,
		                    fontSize: 14.0),
		                PadLeftAlignText(
		                    text: "Toko Anu",
		                    leftPadding: size.getWidthPx(8),
		                    textColor: Colors.black54,
		                    fontSize: 12.0),
		                SizedBox(height: size.getWidthPx(4)),
		                PadLeftAlignText(
		                    text: "100.000",
		                    leftPadding: size.getWidthPx(8),
		                    textColor: colorCurve,
		                    fontSize: 14.0,
		                    fontWeight: FontWeight.w800),
		            ],
	            )
			)
	    );

    }

}


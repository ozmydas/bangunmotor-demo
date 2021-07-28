import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';

class ProductCardA extends StatelessWidget {
	Screen size;
	final GestureTapCallback onTap;
	
	ProductCardA({Key key, this.onTap}): super(key: key);
	
	@override
	Widget build(BuildContext context) {

		size = Screen(MediaQuery.of(context).size);

		return InkWell(
			onTap: onTap,
			child: Card(
		        elevation: 4.0,
		        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
		        clipBehavior: Clip.antiAlias,
		        borderOnForeground: true,
		        child: Column(
		          mainAxisSize: MainAxisSize.min,
		          crossAxisAlignment: CrossAxisAlignment.start,
		          children: <Widget>[
		            SizedBox(
		              height: 4.0,
		            ),
		            Container(
		              child: Center(
		              	child: ClipRRect(
			              	borderRadius: BorderRadius.only(
			              		topLeft: Radius.circular(12.0),
			              		topRight: Radius.circular(12.0)
			              	),
			              	child: Image.asset('assets/images/retropoly.jpg',
			              		fit: BoxFit.fill
			              	)
			           	),
		              ),
		              height: 120.0,
		            ),
		            SizedBox(
		              height: 8.0,
		            ),
		            Padding(
		              padding: const EdgeInsets.only(
		                left: 8.0,
		              ),
		              child: Column(
		                crossAxisAlignment: CrossAxisAlignment.start,
		                mainAxisSize: MainAxisSize.min,
		                children: <Widget>[
			                Text(
			                	"Barang Terlarang",
			                	style: TextStyle(fontSize: 16.0, color: Colors.grey),
			                ),
			                SizedBox(
			                	height: 2.0,
			                ),
			                Row(
			                	mainAxisAlignment: MainAxisAlignment.start,
			                	mainAxisSize: MainAxisSize.min,
			                	children: <Widget>[

				                	Text(
				                		"Rp. 12.000",
				                		style: TextStyle(fontSize: 16.0, color: Colors.black),
				                	),

				                	SizedBox(
				                		width: 8.0,
				                	),

				                	Text(
				                		"15.000",
				                		style: TextStyle(
				                			fontSize: 12.0,
				                			color: Colors.grey,
				                			decoration: TextDecoration.lineThrough,
				               			),
				                	),

			                	],
			                ),
			                SizedBox(
			                	height: 8.0,
			                ),
			                RatingStar(value: 4),
		                ],
		              ),
		            ),
		          ],
		        ),
		    ),
	    );

	}

}
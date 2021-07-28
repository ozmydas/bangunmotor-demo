import 'package:flutter/material.dart';

class ItemButton extends StatelessWidget {
	// property
	final String text;
	final String url;

	// construct
	ItemButton(
		this.text,
		this.url
	);

	_launchURL(String url) async {
		// if (await canLaunch(url)) {
		// 	await launch(url);
		// } else {
		// 	throw 'Could not launch $url';
		// }
		print("launc");
	}

	@override
	Widget build(BuildContext context) {
		return Material(
			color: Colors.transparent,
			child: InkWell(
				onTap: () => _launchURL(url),
				child: Container(
					decoration: BoxDecoration(
						border: Border(
							top: BorderSide(width: 1.0, color: Colors.grey),
							),
						),
					padding: const EdgeInsets.only(top: 15.0, bottom: 15.0,),
					child: Row(
						children: [
						Expanded(
							flex: 1,
							child: Container(
								color: Colors.transparent,
								child: Text(text, style: TextStyle(fontSize: 18.0)),
								),
							),
						Icon(
							Icons.arrow_forward_ios,
							size: 30.0,
							)
						],
						),
					),
				),
			);
	}
}
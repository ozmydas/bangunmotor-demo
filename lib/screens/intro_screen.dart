import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:bangunmotor/widgets/widgets.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/models/intro_model.dart';

import 'login_screen.dart';


class IntroScreen extends StatefulWidget {
	@override
	_IntroScreenState createState() => new _IntroScreenState();
}


class _IntroScreenState extends State<IntroScreen> {
	
	final List<Intro> introlist = [
		Intro(
			image: "assets/images/ufo.png",
			title: "Lorem Ipsum",
			description: "Lorem ipsum dolor sing amet."
		),
		Intro(
			image: "assets/images/ufo.png",
			title: "Lorem Ipsum",
			description: "Lorem ipsum dolor sing amet."
		),
		Intro(
			image: "assets/images/ufo.png",
			title: "Lorem Ipsum",
			description: "Lorem ipsum dolor sing amet."
		),
	];


	List<Widget> _buildPage(BuildContext context){
		List<Widget> widgets = [];

		for(int i=0; i < introlist.length; i++){
			Intro intro = introlist[i];

			widgets.add(
				Container(
					padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/6),
					child: ListView(
						children: [
							Image.asset(intro.image, height: MediaQuery.of(context).size.height/3.5),
							
							Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/10.0)),
							
							Center(
								child: Text(intro.title, style: TextStyle(
									color: Constants.introTitleColor,
									fontSize: 24.0,
									fontWeight: FontWeight.bold,
								)),
							),

							Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/20.0)),

							Container(
								padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.height/20.0),
								child: Text(intro.description, style: TextStyle(
										color: Constants.introDescriptionColor,
										fontSize: 14.0,
									),
									textAlign: TextAlign.center,
								),
							),


							Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/20.0)),

							Visibility(
								visible: i == 2 ? true : false,
								child: Center(
									child: RaisedButton(
										textColor: Colors.white,
										color: Colors.red,
										child: Text("Continue"),
										shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
										onPressed: (){
											LocalStorage.sharedInstance.writeValue(key:Constants.isOnBoard,value: "1");
											Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
										},
									),
								),
							),
							
						]
					),
				),
			);
		}

		return widgets;
	}


	/****/

	@override
	Widget build(BuildContext context){
		return Scaffold(
			backgroundColor: Colors.white,
			body: Swiper.children(
				index: 0,
				autoplay: false,
				loop: false,
				pagination: SwiperPagination(
					margin: EdgeInsets.only(bottom: 20.0),
					builder: DotSwiperPaginationBuilder(
						color: Constants.introDotColor,
						activeColor: Constants.introDotActiveColor,
						size: 10.0,
						activeSize: 10.0,
					),
				),
				control: SwiperControl(
					iconNext: null,
					iconPrevious: null,
				),
				children: _buildPage(context),
			),
		);
	}

}
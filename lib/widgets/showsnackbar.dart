import 'package:flutter/material.dart';

void ShowSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String text, {int duration: 1}){
	final snackbar = SnackBar(
		content: Text(text),
		duration: Duration(seconds: duration),
		backgroundColor: Colors.black.withOpacity(0.7)
	);

	scaffoldKey.currentState.showSnackBar(snackbar); 
}
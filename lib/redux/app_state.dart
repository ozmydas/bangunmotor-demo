import 'package:flutter/material.dart';

class AppState {
	int cartQty;

	AppState(
		{@required this.cartQty});

	AppState.fromAppState(AppState another) {
		cartQty = another.cartQty;
	}

	int get viewCartQty => cartQty;
}
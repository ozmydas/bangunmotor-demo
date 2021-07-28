import 'package:bangunmotor/redux/app_state.dart';
import 'package:bangunmotor/redux/actions.dart';

AppState reducer(AppState prevState, dynamic action) {
	AppState newState = AppState.fromAppState(prevState);

	if (action is CartQtyAddAction) {
		// tambah item di cart
		newState.cartQty = newState.cartQty + action.payload;
	
	} else if (action is CartQtyRemoveAction) {
		// hapus item di cart
		newState.cartQty = newState.cartQty - action.payload;
		newState.cartQty = (newState.cartQty < 1) ? 0 : newState.cartQty;
	
	}

	return newState;
}
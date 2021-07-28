import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';

import './productdetail_screen.dart';

import 'package:flutter_redux/flutter_redux.dart';
import 'package:bangunmotor/redux/app_state.dart';
import 'package:bangunmotor/redux/actions.dart';

class ProductListScreen extends StatefulWidget {
	ProductListScreen({Key key, this.title}) : super(key: key);

	final String title;


	@override
	_ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
	var _scaffoldKey = new GlobalKey<ScaffoldState>();
	Screen size;

	List<String> _listViewData;

	List _sorting = ["Terbaru", "Paling Populer", "Rating Teratas", "Nama Barang (A-Z)", "Nama Barang (Z-A)","Harga Termurah", "Harga Termahal"];
	List _filter = ["Semua", "Baru", "Bekas"];
	String _selectedSorting;


	initState(){
		super.initState();

		setState((){
			_listViewData = [
				"ZERO-ONE",
				"ZERO-TWO!",
				"ZERO-TWO!",
				"ZERO-TWO!",
				"ZERO-TWO!",
				"ZERO-TWO!",
				"ZERO-TWO!",
				"ZERO-TWO!",
				"ZERO-TWO!",
				"ZERO-TWO!",
			];
		});
	}

	/****/

	void onItemSelected(String selectedItem){
		ShowSnackBar(_scaffoldKey, "*selected option : $selectedItem", duration: 3);

		setState(() {
			_selectedSorting = selectedItem;
		});

		// disini _selectedSorting bisa buat dilempar ke API
	} // end func

	
	Future<void> _refreshScreenData() async{
		print("refreshing data...");
	} // end func

	/****/


	Widget _drawTopTab(String title, List jenis, void Function(String) changedDropdown){
		return Expanded(
			child: Column(
				children: [

					Padding(
						padding: EdgeInsets.only(top: 10.0, bottom: 3.0),
						child: Center(child: Text(title)),
					),
					SelectOption(
						values: jenis,
						callback: changedDropdown,
					),
				]
			),
		);
	} // end func


	Widget _productCard(){
		return ProductCardA(
			onTap: (){
            	Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen()));
			},
		);
	}

	Widget _mainBody(AppState state){
		return Scaffold(
			appBar: AppBarSecond(state: state, title: "Products"),
			key: _scaffoldKey,
			body: RefreshIndicator(
				onRefresh: _refreshScreenData,
				child: Column(
					children: [

						Row(
							children: [
								_drawTopTab("Sort", _sorting, onItemSelected),
								_drawTopTab("Filter", _filter, onItemSelected),
							]
						),

						Expanded(
							child: GridView.count(
								crossAxisCount: 2,
								shrinkWrap: true,
								crossAxisSpacing: 8.0,
								mainAxisSpacing: 5.0,
								children: _listViewData
								.map((data) => _productCard()).toList(),
							)
						)
					]
				)
			)
		);
	}


	/****/
	@override
	Widget build(BuildContext context){

		return StoreConnector<AppState, AppState>(
	        converter: (store) => store.state,
	        builder: (context, state) => _mainBody(state),
	    );

	}

}
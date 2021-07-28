import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


class SearchScreen extends StatefulWidget {
	SearchScreen({ Key key }) : super(key: key);
	@override
	_SearchScreenState createState() => new _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
	// controls the text label we use as a search bar
	final TextEditingController _filter = new TextEditingController();
	final dio = new Dio(); // for http requests
	String _searchText = "";
	List names = new List(); // names we get from API
	List filteredNames = new List(); // names filtered by search text

	Icon _searchIcon = new Icon(Icons.search); 
	Widget _appBarTitle = new Text( 'Search Example' );

	/****/

	_SearchScreenState() {
		_filter.addListener(() {
			if (_filter.text.isEmpty) {
				setState(() {
					_searchText = "";
					filteredNames = names;
				});
			} else {
				setState(() {
					_searchText = _filter.text;
				});
			}
		});
	}



	@override
	void initState(){
		_getNames();
		super.initState();
	}

	void _getNames() async {
		final response = await dio.get('https://swapi.co/api/people');
		List tempList = new List();
		for (int i = 0; i < response.data['results'].length; i++) {
			tempList.add(response.data['results'][i]);
		}

		setState(() {
			names = tempList;
			filteredNames = names;
		});
	}

	void _searchPressed() {
		setState(() {
			if (this._searchIcon.icon == Icons.search) {
				this._searchIcon = new Icon(Icons.close);
				this._appBarTitle = new TextField(
					controller: _filter,
					decoration: new InputDecoration(
						prefixIcon: new Icon(Icons.search),
						hintText: 'Search...'
					),
				);
			} else {
				this._searchIcon = new Icon(Icons.search);
				this._appBarTitle = new Text( 'Search Example' );
				filteredNames = names;
				_filter.clear();
			}
		});
	}


	Widget _buildBar(BuildContext context) {
		return new AppBar(
			centerTitle: true,
			title: TextField(
				style: new TextStyle(color: Colors.white),
				controller: _filter,
				decoration: new InputDecoration(
					hintText: 'Cari Barang ...',
					hintStyle: TextStyle(color: Colors.white),
				),
			),
			leading: new IconButton(
	            icon: new Icon(Icons.chevron_left, color: Colors.white),
    	        onPressed: () => Navigator.of(context).pop(),
            ), 
			automaticallyImplyLeading: false, // Used for removing back buttoon. 
			elevation: 0,
			backgroundColor: bgDark,
			brightness: Brightness.dark, 
			actions: [ 
				IconButton(
					icon: _searchIcon,
					color: Colors.white,
					onPressed: _searchPressed,
				)
			]
		);
	}

	Widget _buildList() {
		if (!(_searchText.isEmpty)) {
			List tempList = new List();
			for (int i = 0; i < filteredNames.length; i++) {
				if (filteredNames[i]['name'].toLowerCase().contains(_searchText.toLowerCase())) {
					tempList.add(filteredNames[i]);
				}
			}
			filteredNames = tempList;
		}

		return ListView.builder(
			itemCount: names == null ? 0 : filteredNames.length,
			itemBuilder: (BuildContext context, int index) {
				return new ListTile(
					title: Text(filteredNames[index]['name']),
					onTap: () => print(filteredNames[index]['name']),
				);
			},
		);
	}

	Widget build(BuildContext context) {
		return Scaffold(
			appBar: _buildBar(context),
			body: Container(
				child: _buildList(),
			),
			resizeToAvoidBottomPadding: false,
		);
	}

}
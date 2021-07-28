import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';
import 'package:bangunmotor/widgets/widgets.dart';


class SelectOption extends StatefulWidget {
	final List values;
	final void Function(String) callback;

	SelectOption({Key key, this.values, this.callback}) : super(key: key);

	@override
	_SelectOptionState createState() => _SelectOptionState();
}


class _SelectOptionState extends State<SelectOption> {
	List<DropdownMenuItem<String>> _dropDownMenuItems;
	String _selectedValue;

	
	@override
	void initState() {
		_dropDownMenuItems = getDropDownMenuItems();
    	_selectedValue = _dropDownMenuItems[0].value;

		super.initState();
	}

	/****/

	List<DropdownMenuItem<String>> getDropDownMenuItems() {
		List<DropdownMenuItem<String>> items = new List();
		for (String item in widget.values) {
			items.add(new DropdownMenuItem(
				value: item,
				child: new Text(item)
			));
		}
		return items;
	}

	/****/

	@override
	Widget build(BuildContext context) {

		return Container(
			child: DropdownButton(
				value: _selectedValue,
				items: _dropDownMenuItems,
				onChanged: (String selectedItem){
					setState(() {
						_selectedValue = selectedItem;
					});

					// pass back selected value to parent
					widget.callback(selectedItem);
				},
			),			
		);

	}

}
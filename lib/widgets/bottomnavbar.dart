import 'package:flutter/material.dart';
import 'package:bangunmotor/utils/utils.dart';

class BottomNavBar extends StatefulWidget {
	final ValueChanged<int> changeCurrentTab;

	BottomNavBar({Key key, this.changeCurrentTab}) : super(key: key);

	@override
	_BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin {
	int tab = 0;

	Screen size;

	@override
	Widget build(BuildContext context) {
		size = Screen(MediaQuery.of(context).size);

		return Theme(
			data: Theme.of(context).copyWith(
				canvasColor: bgDark, 
			),
			child: BottomNavigationBar(
				type: BottomNavigationBarType.fixed,
				iconSize: size.getWidthPx(24),
				currentIndex: tab,
				unselectedItemColor: Colors.blue.shade400,
				selectedItemColor: txtGold,
				elevation: 150.0,
				selectedFontSize: 15.0,
				showUnselectedLabels: true,
				onTap: (int index) {
					setState(() {
						if (index != 2) {
							print(index);
							tab = index;
							widget.changeCurrentTab(index);
						}
						});
					},
				items: [
					BottomNavigationBarItem(
						icon: Icon(Icons.home),
						title: Text('Home'),
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.motorcycle),
						title: Text('Simulator'),
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.explore, color: Colors.transparent),
						title: Text(''),
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.notifications),
						title: Text('Notification'),
					),
					BottomNavigationBarItem(
						icon: Icon(Icons.account_circle),
						title: Text('Profile'),
					),
				],
			)
		);
	}
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_yoyo/Screen/setting.dart';
import '../Screen/body.dart';
import '../Screen/hotelscreen.dart';
import 'search-field.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 11, 56, 13,),
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(
            icon: Icon(Icons.hotel), label: "Luxury"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
      ],
      selectedItemColor: Colors.white, // Set the color for the selected item
      unselectedItemColor: Colors.white, // Set the color for unselected items
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });

        if (index == 0) {

          Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => Body()));
          // Navigator.of(context).pushReplacement(
          //     MaterialPageRoute(builder: (context) => TransactionScreen()));
        } else if (index == 1) {
          Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => HotelListPage()));
          // Navigate to search screen
        } else if (index == 2) {
          Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => HotelListScreen()));
        }  else if (index == 3) {
          Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context) => SettingPage()));
        }
      },
    );

  }
}


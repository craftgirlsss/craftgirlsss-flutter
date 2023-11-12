import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/views/mycart/mycarttab.dart';
import 'package:flutter/material.dart';
import 'views/explore/explore.dart';
import 'views/home/home.dart';
import 'views/profile/profilev2.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPage(),
    MyCartProduct(),
    ProfileV2()
  ];

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List listOfColors = [
    const HomePage(),
    const SearchPage(),
    const MyCartProduct(),
    const ProfileV2()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(currentIndex),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          elevation: 0,
          useLegacyColorScheme: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: currentIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey.shade300,
          onTap: _onItemTapped,
          
        ),
      ),
    );
  }
}

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/views/profile/profile.dart';
import 'package:flutter/material.dart';

import 'views/home/home.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List listOfColors = [
    const HomePage(),
    Container(
      color: Colors.redAccent,
    ),
    Container(
      color: Colors.orangeAccent,
    ),
    const ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfColors[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: currentIndex == 0
                ? Image.asset('assets/icons/home-active.png')
                : Image.asset('assets/icons/home-inactive.png'),
            title: Text(
              ' Beranda',
              style: title(fontSize: 18, color: Colors.green),
            ),
          ),
          BottomNavyBarItem(
            icon: currentIndex == 1
                ? Image.asset('assets/icons/explore-active.png')
                : Image.asset('assets/icons/explore-inactive.png'),
            title: Text(
              ' Jelajahi',
              style: title(fontSize: 18, color: Colors.green),
            ),
          ),
          BottomNavyBarItem(
            icon: currentIndex == 2
                ? Image.asset('assets/icons/history-active.png')
                : Image.asset('assets/icons/history-inactive.png'),
            title: Text(
              ' Riwayat',
              style: title(fontSize: 18, color: Colors.green),
            ),
          ),
          BottomNavyBarItem(
            icon: currentIndex == 3
                ? Image.asset('assets/icons/person-active.png')
                : Image.asset('assets/icons/person-inactive.png'),
            title: Text(
              ' Profil',
              style: title(fontSize: 18, color: Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:craftgirlsss/src/view-models/fontstyles/title.dart';
import 'package:craftgirlsss/src/views/mycart/mycarttab.dart';
import 'package:craftgirlsss/src/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'views/explore/explore.dart';
import 'views/home/home.dart';
import 'views/profile/profilev2.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  List listOfColors = [
    const HomePage(),
    const SearchPage(),
    const MyCartProduct(),
    // const ProfileTab()
    const ProfileV2()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: listOfColors[currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Colors.white,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        selectedIndex: currentIndex,
        onItemSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Image.asset(
                'assets/icons/freshicons/fluent_home-32-regular.png',
                scale: 1.3,
              ),
            ),
            title: Text(
              'Home',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Image.asset(
                'assets/icons/freshicons/MagnifyingGlass.png',
                scale: 1.3,
              ),
            ),
            title: Text(
              'Cari',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Image.asset(
                'assets/icons/freshicons/ShoppingCart.png',
                scale: 1.3,
              ),
            ),
            title: Text(
              'Keranjang',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            activeColor: Colors.amber.shade800,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            inactiveColor: Colors.black,
            icon: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Image.asset(
                'assets/icons/freshicons/GearSix.png',
                scale: 1.3,
              ),
            ),
            title: Text(
              'Pengaturan',
              style: titleInter(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

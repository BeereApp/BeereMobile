import 'package:beere/pages/user/home.dart';
import 'package:beere/pages/user/cart.dart';
import 'package:beere/pages/user/profile.dart';
import 'package:beere/pages/user/settings.dart';
import 'package:beere/pages/user/user_home.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      const UserHome(),
      const Profile(),
      const Cart(),
      const Settings()
    ];
    return Scaffold(
      body: Center(
        child: screens.elementAt(_currentIndex)),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _currentIndex == 0
                  ? HexColor("#37A3C8")
                  : HexColor("00353D").withOpacity(0.4),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _currentIndex == 1
                  ? HexColor("#37A3C8")
                  : HexColor("00353D").withOpacity(0.4),
              ),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,
              color: _currentIndex == 2
                  ? HexColor("#37A3C8")
                  : HexColor("00353D").withOpacity(0.4),
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: _currentIndex == 3
                  ? HexColor("#37A3C8")
                  : HexColor("00353D").withOpacity(0.4),
              ),
              label: 'Settings',
            ),
          ],
          selectedItemColor: HexColor("#37A3C8"),
          onTap: _onTap,
        ),
    );
  }
}

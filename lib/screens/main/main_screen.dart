import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/size_config.dart';

import '../../constants.dart';

class MainScreen extends StatefulWidget {
  static String routeName = "/main";

  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int homePage = 0;
  final int favoritePage = 1;
  final int chatPage = 2;
  final int profilePage = 3;
  final Color inActiveIconColor = Color(0xFFB6B6B6);

  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ProfileScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(MediaQuery.of(context));
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Shop Icon.svg",
                  color: _selectedIndex == homePage
                      ? kPrimaryColor
                      : inActiveIconColor),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
                  color: _selectedIndex == favoritePage
                      ? kPrimaryColor
                      : inActiveIconColor),
              label: 'Favorite'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg",
                  color: _selectedIndex == chatPage
                      ? kPrimaryColor
                      : inActiveIconColor),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/User Icon.svg",
                  color: _selectedIndex == profilePage
                      ? kPrimaryColor
                      : inActiveIconColor),
              label: 'Profile'),
        ],
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

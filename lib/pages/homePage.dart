import 'package:flutter/material.dart';
import 'package:new_beginning/bottomNav/categories.dart';
import 'package:new_beginning/bottomNav/favourite.dart';
import 'package:new_beginning/bottomNav/home.dart';
import 'package:new_beginning/bottomNav/profile.dart';
import 'package:new_beginning/util/appColors.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pages = [Home(), Favourite(), Categories(), Profile()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppColors.yellow,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: TextStyle(
              color: AppColors.deep_blue, fontWeight: FontWeight.bold),
          selectedItemColor: AppColors.deep_blue,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: AppColors.deep_blue),
                label: 'Home',
                backgroundColor: AppColors.yellow),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: AppColors.deep_blue),
                label: 'Favourite',
                backgroundColor: AppColors.yellow),
            BottomNavigationBarItem(
                icon: Icon(Icons.grid_view, color: AppColors.deep_blue),
                label: 'Categories',
                backgroundColor: AppColors.yellow),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, color: AppColors.deep_blue),
                label: 'Profile',
                backgroundColor: AppColors.yellow),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}
